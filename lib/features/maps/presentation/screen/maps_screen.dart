import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
        target: dicodingOffice,
      )),
    );
  }
}
