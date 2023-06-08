import librosa
import numpy as np
import tensorflow as tf
from model_loader import load_model

def decode_audio(audio_binary):
    audio, _ = tf.audio.decode_wav(audio_binary)
    return tf.squeeze(audio, axis=-1)


def get_spectrogram(waveform):
    spectrogram = tf.signal.stft(
      waveform, frame_length=255, frame_step=128)
    spectrogram = tf.abs(spectrogram)
    spectrogram = spectrogram[..., tf.newaxis]
    return spectrogram


def make_spec_ds(ds):
    after = ds.map(
      map_func=lambda audio,label: (get_spectrogram(audio), label),
      num_parallel_calls=tf.data.AUTOTUNE)
    return after

def predict(model, file_path):
    audio_binary = tf.io.read_file(file_path)
    ds = decode_audio(audio_binary)
    spectrogram = make_spec_ds(ds)
    prediction = model.predict(spectrogram)
    return prediction
