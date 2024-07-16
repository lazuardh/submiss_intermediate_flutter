// import 'package:flutter/material.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({
//     super.key,
//   });

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData.dark(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Ambil Gambar"),
//           actions: [
//             IconButton(
//               onPressed: () => _onCameraSwitch(),
//               icon: const Icon(Icons.cameraswitch),
//             ),
//           ],
//         ),
//         body: Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Align(
//                 alignment: const Alignment(0, 0.95),
//                 child: _actionWidget(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _actionWidget() {
//     return FloatingActionButton(
//       heroTag: "take-picture",
//       tooltip: "Ambil Gambar",
//       onPressed: () => _onCameraButtonClick(),
//       child: const Icon(Icons.camera_alt),
//     );
//   }

//   Future<void> _onCameraButtonClick() async {}

//   void _onCameraSwitch() async {
//     final navigator = Navigator.of(context);

//     await navigator.push(
//       MaterialPageRoute(
//         builder: (context) => const CameraScreen(),
//       ),
//     );
//   }
// }
