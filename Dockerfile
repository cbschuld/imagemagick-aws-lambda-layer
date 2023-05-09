FROM public.ecr.aws/sam/build-nodejs18.x:latest

WORKDIR /build

COPY Makefile ./

RUN make all

RUN ls -la /build/

# RUN zip -r /build/imagemagick-layer.zip /build/bin /build/share

# RUN mkdir /dist && \
#  echo "cp /build/imagemagick-layer.zip /dist/imagemagick-layer.zip" > /entrypoint.sh && \
#  chmod +x /entrypoint.sh

# ENTRYPOINT "/entrypoint.sh"