import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TCloudinaryService extends GetxController {
  static TCloudinaryService get instance => Get.find();

  static const _cloudName = 'ddf0yaapn';

  /// Load image bytes from local assets
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      return byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
    } catch (e) {
      throw 'Failed to load image from assets: $e';
    }
  }

  Future<String> uploadImageData(
    Uint8List imageBytes, {
    String uploadPreset = 'stem_shop_products',
  }) async {
    try {
      final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/$_cloudName/image/upload',
      );

      final base64Image = base64Encode(imageBytes);
      final dataUri = 'data:image/png;base64,$base64Image';

      final response = await http.post(
        url,
        body: {
          'file': dataUri,
          'upload_preset': uploadPreset,
          // No public_id — Cloudinary generates a unique one automatically
        },
      );

      if (response.statusCode != 200) {
        throw 'Cloudinary upload failed: ${response.body}';
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['secure_url'] as String;
    } catch (e) {
      throw 'Failed to upload image to Cloudinary: $e';
    }
  }
}
