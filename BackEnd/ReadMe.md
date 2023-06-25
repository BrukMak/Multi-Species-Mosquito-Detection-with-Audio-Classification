
# Flask Backend for Mosquito Species Classification

This repository contains the Flask backend implementation for the mosquito species classification system using audio data. The backend serves as an API endpoint to receive audio files and provide predictions for the species of mosquitoes present in the recordings.

## Features

- File upload: The backend supports the uploading of audio files (in WAV format) for mosquito species classification.
- Model loading: It loads a pre-trained deep learning model for making predictions on the uploaded audio files.
- Audio preprocessing: The backend performs necessary preprocessing steps on the audio files, including resampling and feature extraction.
- Model inference: It utilizes the loaded model to predict the mosquito species based on the preprocessed audio data.
- API endpoints: The backend exposes API endpoints to handle file uploads and return the predicted species as JSON responses.

## Usage

1. Clone the repository to your local machine.
2. Install the required dependencies (Flask, TensorFlow, NumPy, SoundFile, PyDub, etc.).
3. Start the Flask server by running the `app.py` script.
4. The server will run on `http://localhost:5000` by default.
5. Use an API testing tool (e.g., cURL, Postman) to send POST requests to the `/predict` endpoint with the audio file attached.
6. The backend will return the predicted mosquito species as a JSON response.

## Model and Dataset

The backend utilizes a pre-trained deep learning model for mosquito species classification. The model has been trained on the "Mosquito Wingbeat Sounds" dataset, which contains audio recordings of different mosquito species. The dataset can be obtained from [insert dataset source/link]. Please refer to the dataset documentation for more information on its structure and usage.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code according to your needs.

Feel free to explore the backend code and adapt it for your own mosquito species classification system. If you have any questions or suggestions, please feel free to contact us.
