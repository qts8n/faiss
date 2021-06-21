#!/bin/bash

git clone --depth 1 --branch $FAISS_VERSION https://github.com/facebookresearch/faiss faiss-build &&
cd faiss-build &&
cmake -B build -S . &&
make -C build -j$(nproc) faiss &&
make -C build -j$(nproc) &&
cd build/faiss/python &&
python setup.py install &&
mv /usr/local/lib/python3.7/site-packages/$FAISS_EGG/faiss /usr/src/faiss &&
rm -rf /usr/src/faiss/faiss-build
