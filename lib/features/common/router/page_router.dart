import 'package:flutter/material.dart';

class PageRouter {
  Route<dynamic>? getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      /* splash */
      //-------------------------------------------------------
      // case PagePath.splash:
      //   return _buildRouter(
      //     settings: settings,
      //     builder: (args) => const SplashScreen(),
      //   );
      //------------------------------------------------------
      default:
        return null;
    }
  }

  Route<dynamic> _buildRouter({
    required RouteSettings settings,
    required Widget Function(Object? arguments) builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => builder(settings.arguments),
    );
  }
}
