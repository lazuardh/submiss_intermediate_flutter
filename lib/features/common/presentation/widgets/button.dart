import 'package:flutter/material.dart';

import '../../../../lib.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary(
    String label, {
    super.key,
    required Function() onPressed,
    TextAlign textAlign = TextAlign.center,
    bool isButtonDisabled = false,
    FontWeight fontWeight = AppFontWeight.bold,
    Color buttonColor = AppColors.purplePrime,
    Color labelColor = AppColors.white,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    double borderRadius = AppBorderRadius.tiny,
    double fontSize = AppFontSize.normal,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.normal,
    double? height,
    double? width,
    double? elevation,
    TextDecoration? textDecoration,
  })  : _label = label,
        _onPressed = onPressed,
        _textAlign = textAlign,
        _fontWeight = fontWeight,
        _buttonColor = buttonColor,
        _labelColor = labelColor,
        _isButtonDisabled = isButtonDisabled,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _fontSize = fontSize,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _height = height,
        _width = width,
        _elevation = elevation,
        _textDecoration = textDecoration;

  final String _label;
  final Function() _onPressed;
  final TextAlign _textAlign;
  final FontWeight _fontWeight;
  final Color _buttonColor;
  final Color? _labelColor;
  final Color _borderColor;
  final double _borderWidth;
  final bool _isButtonDisabled;
  final double _borderRadius;
  final double _fontSize;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final double? _height;
  final double? _width;
  final TextDecoration? _textDecoration;
  final double? _elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height ??
          ResponsiveUtils(context).getResponsiveSize(
            AppButtonSize.normal,
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: _elevation,
          backgroundColor: _buttonColor,
          padding: EdgeInsets.symmetric(
            vertical: _paddingVertical,
            horizontal: _paddingHorizontal,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: _borderColor, width: _borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
          ),
        ),
        onPressed: _isButtonDisabled ? null : _onPressed,
        child: Text(
          _label,
          style: TextStyle(
            fontSize: _fontSize,
            color: _labelColor,
            fontWeight: _fontWeight,
            decoration: _textDecoration,
          ),
          textAlign: _textAlign,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({
    Key? key,
    Color buttonColor = AppColors.purplePrime,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    double borderRadius = AppBorderRadius.small / 2,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.normal,
    double? height,
    double? width,
    Color loadingColor = AppColors.purplePrime,
  })  : _buttonColor = buttonColor,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _height = height,
        _width = width,
        _loadingColor = loadingColor,
        super(key: key);

  final Color _buttonColor;
  final Color _borderColor;
  final double _borderWidth;
  final double _borderRadius;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final double? _height;
  final double? _width;
  final Color _loadingColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height ??
          ResponsiveUtils(context).getResponsiveSize(
            AppButtonSize.normal,
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: _buttonColor,
          disabledBackgroundColor: _buttonColor,
          padding: EdgeInsets.symmetric(
            vertical: _paddingVertical,
            horizontal: _paddingHorizontal,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: _borderColor, width: _borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
          ),
        ),
        onPressed: null,
        child: SizedBox(
          height: _height ??
              ResponsiveUtils(context).getResponsiveSize(
                AppButtonSize.normal,
              ),
          width: _height ??
              ResponsiveUtils(context).getResponsiveSize(
                AppButtonSize.normal,
              ),
          child: LoadingIndicator(color: _loadingColor),
        ),
      ),
    );
  }
}
