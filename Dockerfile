FROM ubuntu:14.04

MAINTAINER David L. Goldberg <davidlgoldberg@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
		bc \
		build-essential \
		cmake \
		curl \
		g++ \
		gfortran \
		git \
    libpng-dev \
    libjpeg8-dev \
    libfreetype6-dev \
		pkg-config \
    python \
		python-dev \
    python-pip \
    python-virtualenv \
		software-properties-common \
		unzip \
		vim \
		wget \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/* && \

RUN pip install --upgrade requests six smart_open ipython[notebook] numpy scipy gensim pandas sklearn matplotlib seaborn

RUN mkdir /home/experiments && cd /home/experiments

# Set up notebook config
# COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
# COPY run_jupyter.sh /root/

# ipython
EXPOSE 8888

# WORKDIR "/root"
CMD ["/bin/bash"]
