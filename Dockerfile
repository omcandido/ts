FROM python:3.12-alpine

# Make sure pip is up to date
RUN pip install --upgrade pip

# Copy the requirements file to the container
COPY requirements.txt .

# Install the requirements
RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

# Tell python where our code will live
ENV PYTHONPATH="${PYTHONPATH}:/app"

# Update the package list and install some basic packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl gpg libgomp1

# This installs the sql server drivers
COPY msodbcsql17.sh .
RUN bash msodbcsql17.sh && rm msodbcsql17.sh

# A fix for the console display, ignore it.
RUN rm -rf /bin/sh && ln -s /usr/bin/bash /bin/sh

# Tell git not to track line endings
RUN git config --global core.autocrlf true

WORKDIR /app


# command build docker image without cache:

# docker build --no-cache -t omcandido/ts .
# docker run --gpus all -it -v ".:/app" omcandido/ts
# docker push omcandido/ts