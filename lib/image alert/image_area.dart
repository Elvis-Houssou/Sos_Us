import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// pickImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();
//   XFile? _file = await _imagePicker.pickImage(source: source);
//   if (_file != null) {
//     return await _file.readAsBytes();
//   }
//   print('Aucune images sélectionné');
// }

Future pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  // Demander la permission d'accéder à la caméra
  var status = await Permission.camera.request();

  if (status == PermissionStatus.granted) {
    try {
      XFile? _file = await _imagePicker.pickImage(source: source);
      if (_file != null) {
        return await _file.readAsBytes();
      } else {
        // L'utilisateur a annulé la sélection
        print('Aucune image sélectionnée');
        return null;
      }
    } catch (e) {
      // Gestion des erreurs lors de la sélection de l'image
      print('Erreur lors de la sélection de l\'image : $e');
      return null;
    }
  } else {
    // L'utilisateur a refusé la permission
    print('Permission refusée pour accéder à la caméra');
    return null;
  }
}
