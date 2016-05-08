FROM nvidia/cuda:cudnn

MAINTAINER Brian Low <brian.low22@gmail.com>


# Theano

RUN apt-get update && apt-get install -y \
  git \
  libopenblas-dev \
  python-dev \
  python-pip \
  python-nose \
  python-numpy \
  python-scipy

ENV CUDA_ROOT=/usr/local/cuda/bin

RUN pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git

RUN echo "[global]\ndevice=gpu\nfloatX=float32\noptimizer_including=cudnn[lib]\ncnmem=1\n[nvcc]\nfastmath=True" > /root/.theanorc


# Keras

RUN apt-get install -y \
  libhdf5-dev \
  python-h5py \
  python-yaml

RUN pip install --upgrade six

RUN cd /root && \
  git clone https://github.com/fchollet/keras.git && \
  cd keras && \
  python setup.py install

WORKDIR /root/keras

# Seems to need at least one successful CPU run before CUDA works
RUN THEANO_FLAGS=mode=FAST_RUN,device=cpu,floatX=float32 python /root/keras/examples/imdb_cnn.py
