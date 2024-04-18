import 'package:flutter/material.dart';

import '../../../lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageRouter router = PageRouter();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: StoryApp().of(context),
      onGenerateRoute: router.getRoute,
    );
  }
}
