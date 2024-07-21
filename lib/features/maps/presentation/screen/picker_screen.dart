import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:provider/provider.dart';
import '../../../../lib.dart';

class PickerScreen extends StatefulWidget {
  final String id;
  const PickerScreen({
    super.key,
    required this.id,
  });

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  geo.Placemark? placemark;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailStoryProvider>(
      create: (context) => DetailStoryProvider(
        StoryRepository(
          StoryRemoteDataSource(Client()),
          AuthRepository(
            AuthRemoteDataSource(),
          ),
        ),
        id: widget.id,
      ),
      child: Consumer<DetailStoryProvider>(
        builder: (context, data, child) {
          final state = data.state;
          return state.map(
            loading: (value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (value) {
              final currentLocation = LatLng(value.data.lat!, value.data.lon!);
              return Center(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        zoom: 18,
                        target: currentLocation,
                      ),
                      markers: markers,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      myLocationButtonEnabled: true,
                      onMapCreated: (controller) async {
                        final info = await geo.placemarkFromCoordinates(
                          currentLocation.latitude,
                          currentLocation.longitude,
                        );

                        final place = info[0];
                        final street = place.street!;
                        final address =
                            '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                        setState(() {
                          placemark = place;
                        });

                        defineMarker(currentLocation, street, address);

                        setState(() {
                          mapController = controller;
                        });
                      },
                      onLongPress: (LatLng latLng) {
                        onLongPressGooleMap(latLng);
                      },
                    ),
                    Positioned(
                      top: 46,
                      right: 16,
                      child: FloatingActionButton(
                        onPressed: () {
                          onMyLocationButtonPress(currentLocation);
                        },
                        child: const Icon(
                          Icons.my_location,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    if (placemark == null)
                      const SizedBox()
                    else
                      Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: _PlaceMarkerWidget(
                          placemark: placemark!,
                        ),
                      )
                  ],
                ),
              );
            },
            error: (value) {
              return Center(
                child: Text(data.message),
              );
            },
            initial: (value) {
              return Center(
                child: Text(data.message),
              );
            },
          );
        },
      ),
    );
  }

  void onLongPressGooleMap(LatLng latLng) async {
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      placemark = place;
    });

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
        markerId: const MarkerId('source'),
        position: latLng,
        infoWindow: InfoWindow(
          title: street,
          snippet: address,
        ));

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }

  void onMyLocationButtonPress(LatLng currentLocation) async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info = await geo.placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }
}

class _PlaceMarkerWidget extends StatelessWidget {
  final geo.Placemark placemark;
  const _PlaceMarkerWidget({
    super.key,
    required this.placemark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  placemark.street!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.administrativeArea}, ${placemark.country}.',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
