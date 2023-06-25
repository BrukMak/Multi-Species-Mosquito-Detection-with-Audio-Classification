# from flask import Flask, request, jsonify
# from werkzeug.utils import secure_filename
# import os
# import model_loader
# import predictor

# app = Flask(__name__)
# app.config['UPLOAD_FOLDER'] = './uploads'

# @app.route('/', methods=['GET'])
# def dummy():
#     return jsonify({'data': "hello"}),200

# @app.route('/predict', methods=['POST'])
# def predict():
#     if 'file' not in request.files:
#         return jsonify({'error': 'No file provided'}), 400

#     file = request.files['file']
#     if file.filename == '':
#         return jsonify({'error': 'No file provided'}), 400

#     if file:
#         filename = secure_filename(file.filename)
#         file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
#         file.save(file_path)

#         model = model_loader.load_model()
#         prediction = predictor.predict(model, file_path)

#         os.remove(file_path)

#         return jsonify({'prediction': prediction}), 200

#     return jsonify({'error': 'An error occurred'}), 500

# if __name__ == '__main__':
#     app.run(debug=True)
from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import tensorflow as tf
import numpy as np
import os

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = './uploads'
# Define the allowed file extensions
ALLOWED_EXTENSIONS = {'wav'}
# Load the trained model and label names
model = tf.keras.models.load_model('my_model.h5')
label_names = ['Ae. aegypti', 'Ae. albopictus', 'An. arabiensis', 'An. gambiae',
       'C. pipiens', 'C. quinquefasciatus']  # Replace with your actual label names

# Helper function to check if a file has an allowed extension
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# Preprocessing function for the uploaded audio file
def preprocess_audio(file_path):
    audio = tf.io.read_file(file_path)
    audio, _ = tf.audio.decode_wav(audio, desired_channels=1)  # Convert to mono
    audio = tf.squeeze(audio, axis=-1)
    audio_length = tf.shape(audio)[0]  # Get the length of the audio

    # Calculate the number of frames required for reshaping
    num_frames = tf.cast(tf.math.ceil(audio_length / 16000), tf.int32)
    target_length = num_frames * 16000

    # Pad or truncate the audio to the target length
    audio = tf.cond(audio_length < target_length,
                    lambda: tf.pad(audio, [[0, target_length - audio_length]]),
                    lambda: audio[:target_length])

    # Reshape the audio to match the model input shape
    audio = tf.reshape(audio, [num_frames, 16000])

    audio = tf.signal.stft(audio, frame_length=256, frame_step=128)
    audio = tf.abs(audio)
    audio = tf.expand_dims(audio, axis=-1)
    return audio

@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No file provided'}), 400
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        # Preprocess the audio
        audio = preprocess_audio(file_path)
        # Make predictions using the loaded model
        output = model.predict(audio)
        max_indices = np.argmax(output, axis=1)
        predicted_labels = [label_names[i] for i in max_indices]
        # Remove the uploaded file
        os.remove(file_path)
        return jsonify({'prediction': predicted_labels}), 200
    return jsonify({'error': 'Invalid file format'}), 400

if __name__ == '__main__':
    app.run(debug=True)

