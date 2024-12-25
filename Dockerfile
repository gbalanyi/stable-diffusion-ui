FROM nvcr.io/nvidia/l4t-jetpack:r35.3.1
#FROM nvidia/cuda:12.2.2-runtime-ubuntu22.04
#FROM nvidia/cuda:11.4.3-cudnn8-runtime-ubuntu20.04
#FROM nvidia/cuda:11.6.2-cudnn8-runtime-ubuntu20.04
#FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04
#FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Budapest

RUN apt-get update && apt-get install -y curl git bzip2 libgl1-mesa-glx libglib2.0-0 libopenblas-dev && rm -rf /var/lib/apt/lists/*

COPY easy-diffusion /easy-diffusion

WORKDIR /easy-diffusion

RUN chmod +x start.sh && /bin/bash start.sh
RUN chmod +x scripts/docker_run.sh

EXPOSE 9000

ENTRYPOINT ["scripts/docker_run.sh"]
