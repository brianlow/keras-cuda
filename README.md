[![Docker Pulls](https://img.shields.io/docker/pulls/brianlow/keras-cuda.svg?style=flat-square)](https://hub.docker.com/r/brianlow/keras-cuda/)
[![Docker Stars](https://img.shields.io/docker/stars/brianlow/keras-cuda.svg?style=flat-square)](https://hub.docker.com/r/brianlow/keras-cuda/)

keras-cuda
==========

[nvidia-docker](https://github.com/NVIDIA/nvidia-docker) + Ubuntu 14.04 + [CUDA 7.5.18](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v4](https://developer.nvidia.com/cuDNN) + [Keras](http://keras.io/).

Requirements
------------

- Host with recent drivers and the [NVIDIA Docker wrapper](https://github.com/NVIDIA/nvidia-docker)
- NVidia GPU with Fermi, Kepler or later architecture

Usage
-----

``` shell
# 10s per epoch (GPU) vs 100s per epoch (CPU)
nvidia-docker run --rm brianlow/keras-cuda python examples/imdb_cnn.py

# or run an interactive shell
nvidia-docker run -i -t brianlow/keras-cuda /bin/bash
```

Notes
-----

- Some tricks to get the NVIDIA Docker wrapper working:
  - To enable the NVIDIA driver on Ubuntu 16.04: Software & Updates -> Additional Drivers -> Use later NVIDIA binary driver (proprietary)
  - Ensure nvidia-docker-plugin is running, either by rebooting or running `sudo nvidia-docker-plugin`
  - Test with `nvidia-docker run --rm nvidia/cuda nvidia-smi`.
  - Your card may still work if it is identified correctly but Processes show "Not Supported".
- Tested with Ubuntu 16.04 host with GeForce GTX 760 (Kepler) and NVIDIA driver 361.42

Alternatives
------------
The NVIDIA Docker wrapper decouples the OS and driver versions between host and container. If you can control both, see
[Kaixhin/dockerfiles](https://github.com/Kaixhin/dockerfiles) for a huge variety of CUDA-enabled machine learning docker images using vanilla docker.
