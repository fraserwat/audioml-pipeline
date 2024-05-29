import os
import pandas as pd
import librosa
import numpy as np


def load_normalised(filepath: str) -> np.ndarray:
    """Given a filepath string, returns that wavfile as a Numpy array normalised [-1, 1]"""
    audio, _ = librosa.load(filepath, sr=None)
    return audio / np.max(np.abs(audio))


def get_files(filepath: str) -> list[str]:
    """Helper function to run through all the wav files in a subdirectory"""
    return [
        os.path.join(filepath, f) for f in os.listdir(filepath) if f.endswith(".wav")
    ]


# Create a DataFrame
df = pd.DataFrame({"noisy": get_files("data/noisy"), "clean": get_files("data/clean")})

print(df.head())
