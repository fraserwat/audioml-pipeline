# AudioML Pipeline

Basic proof of concept for an audio processing pipeline for a denoising machine learning model. Using a noisy/clean parallel .wav dataset from the University of Edinborough.

## Setup

All the setup is put into the `Makefile`, so to get the Python environment ready simply run

```
make setup
```

And to download and unzip the data run:

```
make download-data
```

## To-Do

- [x] Makefile for project setup and environment preparation (virtual environment setup, installing Python libraries, downloading files -- https://datashare.ed.ac.uk/handle/10283/2791)
- [ ] Data Preprocessing: process audio as Python-readable data, normalise.
- [ ] Feed to machine learning model (found a good enough baseline on HuggingFace: https://huggingface.co/spaces/ResembleAI/resemble-enhance)
- [ ] Bash script to run pipeline and output denoised audio.
