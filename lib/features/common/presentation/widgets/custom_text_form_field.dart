import 'package:flutter/material.dart';

import '../../../../lib.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required TextFieldEntity textFieldEntity,
    int maxLines = 1,
    Color backgroundDisable = TextFieldColors.backgroundDisable,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    int? maxLength,
    Widget? widgetSuffix,
    Widget? widgetPrefix,
  })  : _textFieldEntity = textFieldEntity,
        _maxLines = maxLines,
        _backgroundDisable = backgroundDisable,
        _validator = validator,
        _onChanged = onChanged,
        _maxLength = maxLength,
        _widgetSuffix = widgetSuffix,
        _widgetPrefix = widgetPrefix;

  final TextFieldEntity _textFieldEntity;
  final int _maxLines;
  final Color _backgroundDisable;
  final String? Function(String?)? _validator;
  final Function(String)? _onChanged;
  final int? _maxLength;
  final Widget? _widgetSuffix;
  final Widget? _widgetPrefix;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscureText = false;

  @override
  void initState() {
    _isObscureText = widget._textFieldEntity.isPassword;

    widget._textFieldEntity.focusNode?.addListener(() {
      if (widget._textFieldEntity.focusNode?.hasFocus ?? false) {
        FocusScope.of(context).requestFocus(widget._textFieldEntity.focusNode);
      } else {
        widget._textFieldEntity.focusNode?.unfocus();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: Text(
            widget._textFieldEntity.label,
            style: AppTextStyle.semiBold,
          ),
        ),
        Visibility(
          visible: widget._textFieldEntity.label.trim().isNotEmpty,
          child: const Gap(),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._textFieldEntity.textController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: widget._textFieldEntity.textInputAction,
                enabled: widget._textFieldEntity.isEnabled,
                keyboardType: widget._textFieldEntity.keyboardType,
                inputFormatters: widget._textFieldEntity.inputFormatters,
                maxLines: widget._maxLines,
                onChanged: widget._onChanged,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: widget._textFieldEntity.hint,
                  counterText: "",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.purplePrime,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintStyle: AppTextStyle.regular.copyWith(
                    color: AppColors.greyPrimary,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  filled: true,
                  fillColor: widget._textFieldEntity.isEnabled
                      ?
                      //  const Color.fromRGBO(
                      //     243,
                      //     244,
                      //     246,
                      //     1,
                      //   )
                      const Color.fromARGB(255, 255, 255, 255)
                      : widget._backgroundDisable,
                  suffixIcon: Visibility(
                    visible: widget._textFieldEntity.isPassword,
                    child: IconButton(
                      color: AppColors.greyPrimary,
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    ),
                  ),
                  prefixIcon: widget._widgetPrefix,
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                maxLength: widget._maxLength,
                style: AppTextStyle.regular.copyWith(
                  color: AppColors.blackPrimary,
                ),
                obscureText: _isObscureText,
                validator:
                    widget._validator ?? widget._textFieldEntity.validator,
              ),
            ),
            widget._widgetSuffix ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}
