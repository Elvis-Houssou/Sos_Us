// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_storage/firebase_storage.dart' as storage;

// class ImageArea extends StatefulWidget {
//   final Function(String imageUrl) onFileChanged;

//   const ImageArea({super.key, required this.onFileChanged});

//   @override
//   State<ImageArea> createState() => _ImageAreaState();
// }

// class _ImageAreaState extends State<ImageArea> {
//   final ImagePicker _picker = ImagePicker();

//   File ? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (imageUrl == null)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: GestureDetector(
//               onTap: () => _selectPhoto(),
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   border: Border.all(color: Colors.blueAccent, width: 1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                     child: Icon(
//                   Icons.add_photo_alternate,
//                   size: 100,
//                   color: Colors.grey,
//                 )),
//               ),
//             ),
//           ),
//         if (imageUrl != null)
//           InkWell(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onTap: () => _selectPhoto(),
//           ),
//       ],
//     );
//   }

//   Future _selectPhoto() async {
//     await showModalBottomSheet(
//       context: context,
//       builder: (context) => BottomSheet(
//         onClosing: () {},
//         builder: (context) => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera),
//               title: const Text('Camera'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 _pickImage(ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.filter),
//               title: const Text('choisir un fichier'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 _pickImage(ImageSource.gallery);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future _pickImage(ImageSource source) async {
//     final pickedFile =
//         await _picker.pickImage(source: source, imageQuality: 50);
//     if (pickedFile == null) {
//       return;
//     }

//     setState(() {
//       imageUrl = File(pickedFile.path);
//     });

//     // await _uploadFile(pickedFile.path);
//   }

//   // Future _uploadFile(String path) async {
//   //   final ref = storage.FirebaseStorage.instance
//   //       .ref()
//   //       .child('images')
//   //       .child('${DateTime.now().toIso8601String() + path}');

//   //   final result = await ref.putFile(File(path));
//   //   final fileUrl = await result.ref.getDownloadURL();

//   //   setState(() {
//   //     imageUrl = fileUrl;
//   //   });

//   //   widget.onFileChanged(fileUrl);
//   // }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('Aucune images sélectionné');
}
