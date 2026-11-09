import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;

class UserRepository extends GetxService {
  static UserRepository get instance => Get.find();

  static const String _cloudinaryCloudName = 'ddf0yaapn';
  static const String _tfApiBaseUrl = 'https://n8n.tfunions.com/tf-api';

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  Future<void> saveUserRecord(dynamic user) async {
    try {
      await http
          .put(
            Uri.parse('$_tfApiBaseUrl/api/collections/users/${user.id}'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(user.toJson()),
          )
          .timeout(const Duration(seconds: 6));
      return;
    } catch (_) {}

    try {
      final docRef = _db.collection("users").doc(user.id);
      final existing = await docRef.get();
      if (existing.exists) return;

      await docRef.set(user.toJson());
    } on FirebaseException catch (e) {
      throw 'Firebase error: ${e.code}';
    } on FormatException catch (_) {
      throw 'Invalid data format.';
    } on PlatformException catch (e) {
      throw 'Platform error: ${e.code}';
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<Map<String, dynamic>> fetchUserDetailsMap([String? uid]) async {
    final targetUid = uid ?? FirebaseAuth.instance.currentUser?.uid ?? '';
    if (targetUid.isEmpty) return {};
    try {
      final res = await http
          .get(Uri.parse('$_tfApiBaseUrl/api/collections/users/$targetUid'))
          .timeout(const Duration(seconds: 6));
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (body['data'] as Map<String, dynamic>?) ?? body;
      }
    } catch (_) {}

    final documentSnapshot = await _db.collection("users").doc(targetUid).get();
    return documentSnapshot.data() ?? {};
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      await http
          .put(
            Uri.parse('$_tfApiBaseUrl/api/collections/users/$uid'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(json),
          )
          .timeout(const Duration(seconds: 6));
      return;
    } catch (_) {}

    await _db.collection("users").doc(uid).update(json);
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await http
          .delete(Uri.parse('$_tfApiBaseUrl/api/collections/users/$userId'))
          .timeout(const Duration(seconds: 6));
      return;
    } catch (_) {}

    await _db.collection("users").doc(userId).delete();
  }

  Future<String> uploadImage(String uploadPreset, XFile image) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$_cloudinaryCloudName/image/upload',
    );

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath('file', image.path));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw 'Cloudinary upload failed: $responseBody';
    }

    final data = jsonDecode(responseBody) as Map<String, dynamic>;
    return data['secure_url'] as String;
  }
}
