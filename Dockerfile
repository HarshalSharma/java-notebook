# Using a slim Python image as a base
FROM python:3.10-slim

# Installing required packages
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook
RUN pip install --upgrade pip \
    && pip install jupyter

# Install IJava kernel
RUN wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip \
    && unzip ijava-1.3.0.zip -d /usr/local/share/jupyter/kernels/ijava \
    && rm ijava-1.3.0.zip

# Set the Jupyter notebook config
RUN python3 /usr/local/share/jupyter/kernels/ijava/install.py --sys-prefix

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# Start Jupyter Notebook pointing to home directory.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/home"]

# Checkout readme at https://github.com/HarshalSharma/java-notebook
