import 'package:flutter/material.dart';

import '../../../../lib.dart';

class CustomImageWrapper extends StatelessWidget {
  final String _image;
  final double? _height;
  final double? _width;
  final BoxFit _fit;
  final double _borderRadius;
  final bool _isNetworkImage;
  const CustomImageWrapper({
    Key? key,
    required String image,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    double borderRadius = AppBorderRadius.small,
    required bool isNetworkImage,
  })  : _image = image,
        _height = height,
        _width = width,
        _fit = fit,
        _borderRadius = borderRadius,
        _isNetworkImage = isNetworkImage,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: _isNetworkImage
          ? Visibility(
              visible: _image.isNotEmpty,
              replacement: Image.asset(
                AppIllustrations.dummy,
                width: _width,
                height: _height,
                fit: _fit,
              ),
              child: Image.network(
                _image,
                width: _width,
                height: _height,
                fit: _fit,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    width: _width,
                    height: _height,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, exception, stackTrace) {
                  return Image.asset(
                    AppIllustrations.dummy,
                    width: _width,
                    height: _height,
                    fit: _fit,
                  );
                },
              ),
            )
          : Image.asset(
              _image,
              fit: _fit,
              width: _width,
              height: _height,
            ),
    );
  }
}
