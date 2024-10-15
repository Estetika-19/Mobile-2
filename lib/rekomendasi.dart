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
      body: Column(
        children: [
          const SizedBox(height: 5),
          // Header with Image and Text in a horizontal ListView
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 10),
                Center(
                  child: Text(
                    'Website dengan UI yang bagus',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Expanded GridView for recommendations
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2, // Number of items per row
                childAspectRatio: 1 / 1.5, // Adjust the aspect ratio
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildRecommendationItem(
                      context,
                      'YouTube',
                      'https://www.youtube.com',
                      Image.network(src),
                      Colors.red),
                  _buildRecommendationItem(
                      context,
                      'Pinterest',
                      'https://www.pinterest.com',
                      Icons.photo,
                      Colors.redAccent),
                  _buildRecommendationItem(context, 'GitHub',
                      'https://www.github.com', Icons.code, Colors.black),
                  _buildRecommendationItem(
                      context,
                      'Instagram',
                      'https://www.instagram.com',
                      Icons.photo_camera,
                      Colors.purple),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable method for building each recommendation item
  Widget _buildRecommendationItem(BuildContext context, String siteName,
      String url, IconData icon, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 50, color: iconColor),
        const SizedBox(height: 10),
        Text(siteName, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _launchURL(url);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: const Size(100, 20),
            padding: const EdgeInsets.symmetric(horizontal: 5),
          ),
          child: const Text('Visit', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
