import tensorflow as tf

def load_model(model_path='model.h5'):
    model = tf.keras.models.load_model(model_path)
    return model
