import 'package:flutter/material.dart';
import '../../../../lib.dart';

class MapPage extends StatefulWidget {
  final Function() onMapPage;
  const MapPage({
    super.key,
    required this.onMapPage,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<String> _pages = [
    "Maps Screen",
    "Picker Screen",
    "Direction Screen",
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: _pages
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {
                    setState(() {
                      _index = _pages.indexWhere((element) => element == e);
                    });
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        ),
      ),
      appBar: AppBar(
        title: Text(_pages[_index]),
      ),
      body: IndexedStack(
        index: _index,
        children: const [
          MapsScreen(),
          PickerScreen(),
          DirectionScreen(),
        ],
      ),
    );
  }
}
