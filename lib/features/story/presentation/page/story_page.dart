import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  final Function() _onLogout;

  const StoryPage({Key? key, required Function() onLogout})
      : _onLogout = onLogout,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: _onLogout,
        child: const Icon(
          Icons.logout,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
