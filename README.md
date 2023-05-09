# ImageMagick for AWS Lambda (v7.1.1-8)

Github Actions based process to compile ImageMagick utilities for AWS Lambda x86_64 instances powered by Amazon Linux 2.x, for the `python3.7`, `python3.8`, `python3.9`, `nodejs12.x`, `nodejs14.x`, `nodejs16.x` and the `nodejs18.x` lambda runtime.

## Description for AWS Serverless Application Repository

Static build of ImageMagick 7.1.1-8 for Amazon Linux 2 (`x86_64`), packaged as a Lambda layer. Bundles ImageMagick including magick, convert, mogrify and identify tools (excludes: animate, compare, conjure, composite, display, import, montage and stream). Supports webp, jpeg, gif, png, tiff and webm formats (_all included libraries current as of 2023-05-09_).

## Library Versions included in the layer

- IMAGEMAGICK_VERSION = 7.1.1-8 ([imagemagick](https://imagemagick.org/))
- LIBPNG_VERSION = 1.6.39 ([libpng](http://www.libpng.org/pub/png/libpng.html))
- LIBJPG_VERSION = 9e ([libjpg](http://www.ijg.org/))
- OPENJP2_VERSION = 2.5.0 ([openjpeg](https://github.com/uclouvain/openjpeg/))
- LIBTIFF_VERSION = 4.5.0 ([libtiff](http://www.libtiff.org/))
- BZIP2_VERSION = 1.0.6 ([bzip2](https://sourceware.org/bzip2/))
- LIBWEBP_VERSION = 1.3.0 ([libwebp](https://developers.google.com/speed/webp/))

## Prerequisites

If you want to build this environment yourself, you will need:

- Docker
- Unix Make environment

### Bundled libraries

This is not a full-blown ImageMagick setup you can expect on a regular Linux box, it's a slimmed down version to save space that works with the most common formats. You can add more formats by including another library into the build process in [`Makefile`](Makefile).

These libraries are currently bundled:

- [libpng](http://www.libpng.org/pub/png/libpng.html)
- [libjpg](http://www.ijg.org/)
- [openjpeg](https://github.com/uclouvain/openjpeg/)
- [libtiff](http://www.libtiff.org/)
- [libwebp](https://developers.google.com/speed/webp/)

## Deploying to AWS as a layer

Run the following commands to deploy the Github compiled result as a layer in your AWS account.

```
wget https://github.com/cbschuld/imagemagick-aws-lambda-layer/releases/download/7.1.1-8/imagemagick-layer.zip
aws lambda publish-layer-version \
    --layer-name imagemagick-v7-1-1_8 \
    --description "ImageMagick v7.1.1-8" \
    --compatible-runtimes nodejs16.x nodejs18.x \
    --compatible-architectures x86_64 \
    --zip-file fileb://imagemagick-layer.zip
```

## Author

Chris Schuld &middot; [https://chrisschuld.com/](https://chrisschuld.com/)

Credit to the author here for help and guidance on the Makefiles - https://github.com/serverlesspub/imagemagick-aws-lambda-2 by Gojko Adzic <https://gojko.net>

## License

- These scripts: [MIT](https://opensource.org/licenses/MIT)
- ImageMagick: https://imagemagick.org/script/license.php
- Each library has separate licenses, check the respective web sites for more information
