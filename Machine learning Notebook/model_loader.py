import tensorflow as tf

def load_model(model_path='my_model.h5'):
    model = tf.keras.models.load_model(model_path)
    return model
