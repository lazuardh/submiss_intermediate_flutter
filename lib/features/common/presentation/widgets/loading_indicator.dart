import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../lib.dart';

class LoadingIndicator extends StatelessWidget {
  final Color _color;
  const LoadingIndicator({Key? key, Color color = AppColors.purplePrime})
      : _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppGap.normal,
      ),
      child: Center(
        child: (!kIsWeb && Platform.isIOS)
            ? CupertinoActivityIndicator(color: _color)
            : CircularProgressIndicator(color: _color),
      ),
    );
  }
}
