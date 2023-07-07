import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

class pdf_controller extends GetxController {
  RxString pdfText = ''.obs;

  Future<void> getPDFtext(String path) async {
    String text = "";
    try {
      text = await ReadPdfText.getPDFtext(path);
    } on PlatformException {
      Get.snackbar("Error", "Failed to get PDF text.");
    }
    pdfText.value = text;
  }

  void selectPdf() async {
    // Allow the user to select a PDF file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      // Get the path of the selected PDF file
      String? path = result.files.first.path;
      if (path == null) {
        return;
      } else {
        // Perform further operations with the selected PDF file
        // For example, you can store the path or load the PDF file using a PDF viewer widget
        await getPDFtext(path);
        print('Selected PDF path: $path');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }
}