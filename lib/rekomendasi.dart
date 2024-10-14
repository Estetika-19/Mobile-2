import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({super.key});

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Situs Rekomendasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // YouTube Link
            InkWell(
              onTap: () => _launchURL('https://www.youtube.com'),
              child: Row(
                children: const [
                  Icon(Icons.video_library, color: Colors.red),
                  SizedBox(width: 10),
                  Text(
                    'YouTube',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Pinterest Link
            InkWell(
              onTap: () => _launchURL('https://www.pinterest.com'),
              child: Row(
                children: const [
                  Icon(Icons.photo, color: Colors.redAccent),
                  SizedBox(width: 10),
                  Text(
                    'Pinterest',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // GitHub Link
            InkWell(
              onTap: () => _launchURL('https://www.github.com'),
              child: Row(
                children: const [
                  Icon(Icons.code, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'GitHub',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Instagram Link
            InkWell(
              onTap: () => _launchURL('https://www.instagram.com'),
              child: const Row(
                children: [
                  Icon(Icons.photo_camera, color: Colors.purple),
                  SizedBox(width: 10),
                  Text(
                    'Instagram',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
