# Makefile to set up Python environment for the audio project
setup:
# Assuming this is used from scratch, want to get rid of any old envs if applicable.
	@rm -rf venv
	@echo "Setting up the Python environment..."
	@python3 -m venv venv
	@venv/bin/pip install -r requirements.txt

# Command to download and unzip data. Each download+unzip is batched into a single subshell,
# in order to control scope/dependencies over each block.
download-data:
# Get rid of any old data
	@if [ -d data/noisy ] || [ -d data/clean ]; then \
		echo "Replacing old datasets..."; \
		rm -rf data/noisy data/clean; \
	else \
		echo "Downloading and extracting datasets..."; \
	fi
	@mkdir -p data/noisy data/clean

# Download and unzip noisy data
	@echo "Starting download of noisy dataset..."
	@{ \
		curl -o data/noisy.zip "https://datashare.ed.ac.uk/bitstream/handle/10283/2791/noisy_testset_wav.zip?sequence=5&isAllowed=y"; \
		echo "Download completed. Unzipping noisy dataset..."; \
		unzip -o -j data/noisy.zip -d data/noisy; \
		rm data/noisy.zip; \
		echo "Noisy dataset processed."; \
	}

# Download and unzip clean data
	@echo "Starting download of clean dataset..."
	@{ \
		curl -o data/clean.zip "https://datashare.ed.ac.uk/bitstream/handle/10283/2791/clean_testset_wav.zip?sequence=1&isAllowed=y"; \
		echo "Download completed. Unzipping clean dataset..."; \
		unzip -o -j data/clean.zip -d data/clean; \
		rm data/clean.zip; \
		echo "Clean dataset processed."; \
	}

.PHONY: setup download-data
