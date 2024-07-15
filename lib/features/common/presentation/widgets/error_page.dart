import 'package:flutter/material.dart';
import 'package:submiss_intermediate/core/constant/constant.dart';

class ErrorPages extends StatelessWidget {
  const ErrorPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(StringConstant.notFound),
      ),
    );
  }
}
