# faiss

##### Docker image with built-in Faiss engine and Faiss Python package

This image contains Faiss library built from source and Faiss Python package in
`PYTHONPATH` environment variable.

The image is based on `devel` tag of `qts8n/cuda-python` image.
It has `cuda-9.1` and `cuda-10.2` tags with support of CUDA 9.1 and CUDA 10.2 versions respectively.

Containers with this image can be run without GPU support if needed. Use correct
contructor arguments for Faiss Python package to disable GPU support.

## References

see: [Faiss](https://github.com/facebookresearch/faiss) github

see: [qts8n/cuda-python](https://hub.docker.com/r/qts8n/cuda-python) docker-hub

see: [nvidia/cuda](https://hub.docker.com/r/nvidia/cuda) docker-hub

