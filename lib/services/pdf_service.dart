import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class PdfService {
  static Future<void> openAssetPdf(String fileName) async {
    try {
      final byteData = await rootBundle.load("assets/pdfs/$fileName");

      final dir = await getTemporaryDirectory();
      final file = File("${dir.path}/$fileName");

      await file.writeAsBytes(byteData.buffer.asUint8List());
      await OpenFilex.open(file.path);
    } catch (e) {
      throw Exception("Failed to open PDF");
    }
  }
}
