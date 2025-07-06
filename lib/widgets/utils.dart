import 'dart:io';
import 'dart:ui';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:image_picker/image_picker.dart';

// Color strengthenColor(Color color, double factor) {
//   int r = (color.red * factor).clamp(0, 255).toInt();
//   int g = (color.green * factor).clamp(0, 255).toInt();
//   int b = (color.blue * factor).clamp(0, 255).toInt();
//   return Color.fromARGB(color.alpha, r, g, b);

// }

Color strengthenColor(Color color, double factor) {
  final Color c = color;
  int r = (c.red8bit * factor).clamp(0, 255).toInt();
  int g = (c.green8bit * factor).clamp(0, 255).toInt();
  int b = (c.blue8bit * factor).clamp(0, 255).toInt();
  return Color.fromARGB(c.alpha8bit, r, g, b);
}

String rgbToHex(Color color) {
  return '${color.red8bit.toRadixString(16).padLeft(2, '0')}${color.green8bit.toRadixString(16).padLeft(2, '0')}${color.blue8bit.toRadixString(16).padLeft(2, '0')}';
}

Color hexToColor(String hex) {
  return Color(int.parse(hex, radix: 16) + 0xFF000000);
}

Future<File?> selectImage() async {
  final imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    return File(file.path);
  }
  return null;
}
