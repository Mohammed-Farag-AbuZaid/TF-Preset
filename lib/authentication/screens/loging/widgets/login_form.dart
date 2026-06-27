import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stem_shop/features/authentication/controllers/login/loging_controllers.dart';
import 'package:stem_shop/features/authentication/screens/password_configrations/forget_password.dart';
import 'package:stem_shop/utils/constants/sizes.dart';
import 'package:stem_shop/utils/constants/text_strings.dart';
import 'package:stem_shop/utils/popups/loaders.dart';
import 'package:stem_shop/utils/validators/validation.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: ((value) => TValidator.validateEmail(value)),
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: TSizes.spaceBwInputFields),

            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: ((value) =>
                    TValidator.validateEmptyText('Password', value)),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBwInputFields / 2),

            // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text("Remember me"),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text("Forgot password?"),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordLogin(),
                child: Text(TTexts.signIn),
              ),
            ),

            const SizedBox(height: TSizes.spaceBwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(
                    "https://tfunions.vercel.app/",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication, // ← forces browser
                    );
                  } else {
                    TLoaders.errorSnackBar(
                      title: 'Error',
                      message: 'Could not open the link. Please try again.',
                    );
                  }
                },
                child: const Text("Create a TF account."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
