import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, this.title, this.message, this.email});

  final String? title;
  final String? message;
  final String? email;

  @override
  Widget build(BuildContext context) {
    final String title = this.title ?? 'Password Reset Email Sent';
    final String message = this.message ?? 'your Account Security is our top priority. We have sent you an email to $email with instructions to reset your password.';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Image
              Image(
              image: const AssetImage(TImages.emailSentImage),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: TSizes.spaceBwSections),

            /// Title and Subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBwSections),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBwSections * 2),
            /// Resend Email Button
           
            /// Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                
                child: const Text("Done"),
              ),
            ),
            SizedBox(height: TSizes.spaceBwItems),
             if (email != null)
              TextButton(
                onPressed: () => Get.find<ForgetPasswordController>().resendPasswordResetEmail(email!),
                child: const Text("Resend Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}