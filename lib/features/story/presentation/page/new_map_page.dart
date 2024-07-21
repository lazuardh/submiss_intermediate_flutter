import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../lib.dart';

class NewMapPage extends StatefulWidget {
  final Function() onAddMap;
  const NewMapPage({
    super.key,
    required this.onAddMap,
  });

  @override
  State<NewMapPage> createState() => _NewMapPageState();
}

class _NewMapPageState extends State<NewMapPage> {
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  late GoogleMapController mapController;
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (markers.isNotEmpty) {
            final marker = markers.first;
            await context.read<UploadProvider>().getCurrentMap(marker.position);

            print('=========== add location =========================');
            print(
                context.read<UploadProvider>().getCurrentMap(marker.position));

            widget.onAddMap();
          }
        },
        child: const Icon(
          Icons.add_location_alt_outlined,
          color: AppColors.white,
        ),
      ),
      body: Center(
        child: GoogleMap(
          markers: markers,
          initialCameraPosition: CameraPosition(
            zoom: 17,
            target: dicodingOffice,
          ),
          myLocationEnabled: true,
          onLongPress: (LatLng latLang) {
            onMyCurrentLocation(latLang);
          },
          onMapCreated: (controller) {
            final marker = Marker(
              markerId: const MarkerId("source"),
              position: dicodingOffice,
            );

            setState(() {
              mapController = controller;
              markers.add(marker);
            });
          },
        ),
      ),
    );
  }

  void onMyCurrentLocation(LatLng latLng) async {
    defineMarker(latLng);
    mapController.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void defineMarker(LatLng latLng) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
    );
    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}
