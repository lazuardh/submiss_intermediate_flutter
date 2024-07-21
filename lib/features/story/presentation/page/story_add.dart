import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../lib.dart';

class StoryAdd extends StatefulWidget {
  final Function() onAddStory;
  final Function() onAddMap;
  const StoryAdd({
    super.key,
    required this.onAddStory,
    required this.onAddMap,
  });

  @override
  State<StoryAdd> createState() => _StoryAddState();
}

class _StoryAddState extends State<StoryAdd> {
  final List<TextFieldEntity> _description = TextFieldEntity.authAddStory;

  @override
  void initState() {
    for (var dt in _description) {
      dt.textController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final latLangData = context.watch<UploadProvider>();

    if (latLangData.latLng != null) {
      _description[1].textController.text = latLangData.latitude.toString();
      _description[2].textController.text = latLangData.longitude.toString();
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 244, 246, 1),
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.red,
        title: Text(
          "New Story",
          style: AppTextStyle.bold.copyWith(
            color: AppColors.white,
            fontSize: AppFontSize.large,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ColumnPadding(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            padding: const EdgeInsets.all(12),
            children: [
              context.watch<CameraProvider>().imagePath == null
                  ? const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image,
                        size: 200,
                      ),
                    )
                  : SizedBox(
                      height:
                          ResponsiveUtils(context).getMediaQueryHeight() * 0.3,
                      child: _showImage(),
                    ),
              const Gap(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _onGalleryView(),
                    child: const Text("Gallery"),
                  ),
                  ElevatedButton(
                    onPressed: () => _onCameraView(),
                    child: const Text("Camera"),
                  ),
                  // ElevatedButton(
                  //   onPressed: () => _onCustomCameraView(),
                  //   child: const Text("Custom Camera"),
                  // ),
                ],
              ),
              const Gap(height: 20),
              CustomTextFormField(
                  textFieldEntity: _description[0], maxLines: 5),
              const Gap(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomTextFormField(
                      textFieldEntity: _description[1],
                      onChanged: (value) {
                        if (value.isEmpty) {
                          latLangData.setLatitude(null);
                        }
                        latLangData.setLatitude(double.tryParse(value));
                      },
                    ),
                  ),
                  const Gap(width: 10),
                  Expanded(
                    flex: 4,
                    child: CustomTextFormField(
                      textFieldEntity: _description[2],
                      onChanged: (value) {
                        if (value.isEmpty) {
                          latLangData.setLongitude(null);
                        }
                        latLangData.setLongitude(double.tryParse(value));
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () => _clearlatLng(),
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () => widget.onAddMap(),
                      icon: const Icon(
                        Icons.add_location_alt_rounded,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(height: 20),
              context.watch<UploadProvider>().isUploading
                  ? const ButtonLoading(
                      buttonColor: AppColors.red,
                      borderRadius: AppBorderRadius.normal,
                    )
                  : ButtonPrimary(
                      "Upload",
                      borderRadius: AppBorderRadius.normal,
                      buttonColor: AppColors.red,
                      onPressed: () => _onUpload(),
                    )
            ],
          ),
        ),
      ),
    );
  }

  _clearlatLng() {
    print("=========== Clearing latitude and longitude ===========");
    final latLangData = context.read<UploadProvider>();
    _description[1].textController.clear();
    _description[2].textController.clear();
    latLangData.clearLatLng();

    final ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);

    scaffoldMessengerState.showSnackBar(
      const SnackBar(content: Text("clearing Textfield Success")),
    );
  }

  _onUpload() async {
    FocusScope.of(context).unfocus();

    final storyProvider = context.read<CameraProvider>();
    final uploadProvider = context.read<UploadProvider>();
    final refreshProvider = context.read<StoryProvider>();

    final ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);

    final imagePath = storyProvider.imagePath;
    final imageFile = storyProvider.imageFile;
    if (imagePath == null || imageFile == null) return;

    final fileName = imageFile.name;
    final bytes = await imageFile.readAsBytes();
    final newBytes = await uploadProvider.compressImage(bytes);

    double? latitude = _description[1].textController.text.isEmpty
        ? null
        : double.tryParse(_description[1].textController.text);
    double? longitude = _description[2].textController.text.isEmpty
        ? null
        : double.tryParse(_description[2].textController.text);

    print('Latitude: $latitude');
    print('Longitude: $longitude');

    await uploadProvider.upload(
      newBytes,
      fileName,
      _description[0].textController.text.toString(),
      latitude,
      longitude,
    );

    if (uploadProvider.uploadResponse != null) {
      storyProvider.setImageFile(null);
      storyProvider.setImagePath(null);
    }

    scaffoldMessengerState.showSnackBar(
      SnackBar(content: Text(uploadProvider.message)),
    );

    print(uploadProvider.message);

    refreshProvider.refreshStories();
  }

  _onGalleryView() async {
    final provider = context.read<CameraProvider>();

    final isMacOs = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOs || isLinux) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  _onCameraView() async {
    final provider = context.read<CameraProvider>();

    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isIos);
    if (isNotMobile) return;

    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  // _onCustomCameraView() async {}

  Widget _showImage() {
    final imagePath = context.read<CameraProvider>().imagePath;
    return kIsWeb
        ? Image.network(
            imagePath.toString(),
            fit: BoxFit.contain,
          )
        : Image.file(
            File(imagePath.toString()),
            fit: BoxFit.contain,
          );
  }
}
