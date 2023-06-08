from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import os
import model_loader
import predictor

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = './uploads'

@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No file provided'}), 400

    if file:
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)

        model = model_loader.load_model()
        prediction = predictor.predict(model, file_path)

        os.remove(file_path)

        return jsonify({'prediction': prediction}), 200

    return jsonify({'error': 'An error occurred'}), 500

if __name__ == '__main__':
    app.run(debug=True)
