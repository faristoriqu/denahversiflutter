import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutterku/models/view_model.dart';
import 'package:image_picker/image_picker.dart';

class UploadController {
  static Future<File> getImage() async {
    await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  static Future getFile() async {
    File file = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['svg'],
    );

    if (file != null) {
      print("path filenya itu ini = " + file.path);
      //print("filenya Uri ini" + file.uri.toFilePath());
      // ParsingDataModel.handleParsing("assets/images/kavling_2.svg");
      // ParsingDataModel.handleParsing("assets/images/tahap1_canvas.svg");
      ParsingDataModel.handleParsing(file);
    }
  }
}
