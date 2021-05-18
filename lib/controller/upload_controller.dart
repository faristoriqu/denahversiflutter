import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutterku/models/view_model.dart';
import 'package:image_picker/image_picker.dart';

class UploadController {
  static Future<File> getImage() async {
    return await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  static Future getFile() async {
    File file = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['svg', 'jpg'],
    );
    if (file != null) {
      print("filenya itu ini" + file.path);
      ParsingDataModel.handleParsing(file.path);
    }
  }
}
