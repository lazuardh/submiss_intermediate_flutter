import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;
import '../../../../lib.dart';

class UploadProvider extends ChangeNotifier {
  final StoryRepository _storyRepository;

  UploadProvider(this._storyRepository);

  bool isUploading = false;
  String message = "";
  UploadResponse? uploadResponse;

  LatLng? _latLng;
  LatLng? get latLng => _latLng;

  double? _latitude;
  double? _longitude;

  double? get latitude => _latitude;
  double? get longitude => _longitude;

  Future<void> getCurrentMap(LatLng value) async {
    _latLng = value;
    setLatitude(value.latitude);
    setLongitude(value.longitude);
    notifyListeners();
  }

  void setLatitude(double? latitude) {
    _latitude = latitude;
    if (_latitude != null && _longitude != null) {
      _latLng = LatLng(_latitude!, _longitude!);
    }
    notifyListeners();
  }

  void setLongitude(double? longitude) {
    _longitude = longitude;
    if (_latitude != null && _longitude != null) {
      _latLng = LatLng(_latitude!, _longitude!);
    }
    notifyListeners();
  }

  void clearLatLng() {
    _latitude = null;
    _longitude = null;
    _latLng = null;
    notifyListeners();
    print("Provider clear Latitude and Longitude");
  }

  Future<void> upload(
    List<int> bytes,
    String fileName,
    String description,
    double? lat,
    double? lon,
  ) async {
    try {
      message = '';
      uploadResponse = null;
      isUploading = true;
      notifyListeners();

      uploadResponse = await _storyRepository.postStory(
        bytes,
        fileName,
        description,
        lat,
        lon,
      );

      message = uploadResponse?.message ?? "success";
      isUploading = false;
      notifyListeners();
    } catch (e) {
      isUploading = false;
      message = e.toString();
      print(message);
      notifyListeners();
    }
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];

    do {
      compressQuality -= 10;

      newByte = img.encodeJpg(image, quality: compressQuality);

      length = newByte.length;
    } while (length > 1000000);

    return newByte;
  }
}
