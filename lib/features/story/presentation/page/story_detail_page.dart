import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart' as geo;
import '../../../../lib.dart';

class StoryDetailPage extends StatefulWidget {
  final String id;
  final Function(String) onTapped;

  const StoryDetailPage({
    Key? key,
    required this.id,
    required this.onTapped,
  }) : super(key: key);

  @override
  _StoryDetailPageState createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.red,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Detail Story",
          style: AppTextStyle.bold.copyWith(
            color: AppColors.white,
            fontSize: AppFontSize.large,
          ),
        ),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<DetailStoryProvider>(
          create: (context) => DetailStoryProvider(
            StoryRepository(
              StoryRemoteDataSource(Client()),
              AuthRepository(AuthRemoteDataSource()),
            ),
            id: widget.id,
          ),
          child: Consumer<DetailStoryProvider>(
            builder: (ctx, provider, _) {
              final state = provider.state;
              return state.map(
                loading: (value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (value) {
                  return _StoryDetailWrapper(
                    story: value.data,
                    onTap: () => widget.onTapped(value.data.id),
                  );
                },
                error: (value) {
                  return Center(
                    child: Text(provider.message),
                  );
                },
                initial: (value) {
                  return Center(
                    child: Text(provider.message),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StoryDetailWrapper extends StatefulWidget {
  final DetailStory _story;
  final void Function()? onTap;

  const _StoryDetailWrapper({
    super.key,
    required DetailStory story,
    required this.onTap,
  }) : _story = story;

  @override
  State<_StoryDetailWrapper> createState() => _StoryDetailWrapperState();
}

class _StoryDetailWrapperState extends State<_StoryDetailWrapper> {
  late final Set<Marker> markers = {};
  geo.Placemark? placemark;
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageWrapper(
          image: widget._story.photoUrl,
          width: double.infinity,
          height: ResponsiveUtils(context).getMediaQueryHeight() * 0.4,
          borderRadius: 0,
          fit: BoxFit.cover,
          isNetworkImage: true,
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.8,
          minChildSize: 0.7,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(228, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(214, 211, 216, 228),
                      offset: Offset(0, 0.5),
                      spreadRadius: 0.5,
                    )
                  ]),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget._story.name,
                      style: AppTextStyle.black.copyWith(
                        fontSize: AppFontSize.big,
                      ),
                    ),
                    Text(
                      "Create At: ${widget._story.createdAt}",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.greyPrimary,
                        fontSize: AppFontSize.small,
                      ),
                    ),
                    const Gap(height: 8),
                    Text(
                      "Location :",
                      style: AppTextStyle.regular.copyWith(
                        fontSize: AppFontSize.medium,
                        color: AppColors.greyPrimary,
                      ),
                    ),
                    const Gap(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(55, 242, 120, 107),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ColumnPadding(
                        padding: const EdgeInsets.all(12),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Lantitude",
                                    style: AppTextStyle.black.copyWith(
                                      fontSize: AppFontSize.normal,
                                    ),
                                  ),
                                  Text(
                                    widget._story.lat != null
                                        ? widget._story.lat.toString()
                                        : "-",
                                    style: AppTextStyle.regular.copyWith(
                                      fontSize: AppFontSize.small,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                              Container(
                                color: AppColors.blackPrimary,
                                width: 2,
                                height: 40,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Lontitude",
                                    style: AppTextStyle.black.copyWith(
                                      fontSize: AppFontSize.normal,
                                    ),
                                  ),
                                  Text(
                                    widget._story.lon != null
                                        ? widget._story.lon.toString()
                                        : "-",
                                    style: AppTextStyle.regular.copyWith(
                                      fontSize: AppFontSize.small,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(height: 10),
                          widget._story.lat != null && widget._story.lon != null
                              ? _maps()
                              : const SizedBox()
                        ],
                      ),
                    ),
                    const Gap(height: 10),
                    Text(
                      "Description :",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.greyPrimary,
                      ),
                    ),
                    Text(
                      widget._story.description,
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.blackPrimary,
                        fontSize: AppFontSize.medium,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Container _maps() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 700,
        maxHeight: 200,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greyLighter,
      ),
      child: Stack(
        children: [
          GoogleMap(
            markers: markers,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              zoom: 10.0,
              target: LatLng(
                widget._story.lat!,
                widget._story.lon!,
              ),
            ),
            onMapCreated: (controller) async {
              final info = await geo.placemarkFromCoordinates(
                widget._story.lat!,
                widget._story.lon!,
              );

              final place = info[0];
              final street = place.street!;
              final address =
                  '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

              setState(() {
                placemark = place;
              });

              _defineMarker(
                LatLng(
                  widget._story.lat!,
                  widget._story.lon!,
                ),
                street,
                address,
              );

              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: widget.onTap,
              icon: const Icon(
                Icons.open_in_new,
                color: AppColors.blackPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _defineMarker(LatLng latLng, String street, String address) {
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
}
