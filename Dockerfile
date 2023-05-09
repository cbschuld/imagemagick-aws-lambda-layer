FROM public.ecr.aws/sam/build-nodejs18.x:latest

WORKDIR /build

COPY Makefile ./

RUN yum groupinstall -y "Development Tools"

# # Update package manager and install necessary dependencies
# RUN yum update -y && \
#     yum install -y gcc-c++ make openssl-devel

# # Download and install CMake
# RUN curl -LO https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz && \
#     tar -xzvf cmake-3.26.3.tar.gz && \
#     cd cmake-3.26.3 && \
#     ./bootstrap --system-curl && \
#     make -j$(nproc) && \
#     make install

# # Cleanup
# RUN rm -rf cmake-3.26.3 cmake-3.26.3.tar.gz

# # Set PATH environment variable to include CMake
# ENV PATH="/usr/local/bin:${PATH}"

RUN make all

RUN ls -la /build/

# RUN zip -r /build/imagemagick-layer.zip /build/bin /build/share

# RUN mkdir /dist && \
#  echo "cp /build/imagemagick-layer.zip /dist/imagemagick-layer.zip" > /entrypoint.sh && \
#  chmod +x /entrypoint.sh

# ENTRYPOINT "/entrypoint.sh"