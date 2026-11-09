import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitTFButton extends StatelessWidget {
  const VisitTFButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final uri = Uri.parse('https://www.tfunions.com');
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        },
        child: const Text('Visit TF-Unions'),
      ),
    );
  }
}
