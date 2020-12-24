FROM pytorch/pytorch:1.5.1-cuda10.1-cudnn7-devel 

MAINTAINER humanbeingZ

RUN rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends git

WORKDIR /root

RUN git clone https://github.com/facebookresearch/SparseConvNet.git --single-branch --depth 1

RUN cd ./SparseConvNet && bash develop.sh && cd ../

RUN python -m pip install scipy plyfile

RUN git clone https://github.com/humanbeingZ/sgnn.git --depth 1

RUN cd ./sgnn/torch/marching_cubes && python -m pip install . && cd /root/
