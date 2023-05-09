FROM public.ecr.aws/sam/build-nodejs18.x:latest

WORKDIR /build

COPY Makefile ./

RUN yum update -y
RUN yum groupinstall -y "Development Tools"
RUN yum install -y cmake

RUN make all

WORKDIR /opt

# remove several of the runtime assets for sizing issues
RUN zip -r /build/imagemagick-layer.zip . -x "bin/animate" "bin/compare" "bin/conjure" "bin/composite" "bin/display" "bin/import" "bin/montage" "bin/stream"

RUN mkdir /dist && \
 echo "cp /build/imagemagick-layer.zip /dist/imagemagick-layer.zip" > /entrypoint.sh && \
 chmod +x /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"