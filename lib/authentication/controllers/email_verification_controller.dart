
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

  /// Resend Email Verification Email
  Future<void> resendEmailVerificationEmail(String email) async {
    try {
      TFuelScreenLoader.openLoadingDialog(
        'Sending verification email...',
        'assets/images/loading.json',
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFuelScreenLoader.stopLoading();

        TLoaders.warningSnackBar(
          title: 'No Connection',
          message: 'Please check your internet connection.',
        );

        return;
      }

      await AuthenticationRepository.instance.sendEmailVerification();

      TFuelScreenLoader.stopLoading();

      TLoaders.warningSnackBar(
        title: 'Email Verification',
        message:
            'A verification email has been sent to $email. Please check your inbox.',
      );
    } catch (e) {
      TFuelScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }

}