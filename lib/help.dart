import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  // Function for logging out (for demonstration purposes)
  void _logout(BuildContext context) {
    // You can add your actual logout logic here.
    Navigator.pop(context); // For now, it just navigates back to the previous screen.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'How to Use This App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildInstructionStep(
              stepNumber: '1',
              title: 'Explore Features',
              description:
                  'Browse through the various features available in the app from the home page. You can navigate to Stopwatch, Recommendations, and more.',
            ),
            const SizedBox(height: 10),
            _buildInstructionStep(
              stepNumber: '2',
              title: 'Access Recommended Sites',
              description:
                  'In the "Rekomendasi" section, explore top websites like YouTube, Pinterest, GitHub, and Instagram by tapping on the respective icons.',
            ),
            const SizedBox(height: 10),
            _buildInstructionStep(
              stepNumber: '3',
              title: 'Use the Stopwatch',
              description:
                  'Track your time with ease using the Stopwatch feature. Navigate to the Stopwatch section to start, pause, or reset your timing sessions.',
            ),
            const SizedBox(height: 10),
            _buildInstructionStep(
              stepNumber: '4',
              title: 'Logout',
              description:
                  'When you\'re done, tap the logout button below to exit the app securely.',
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each instruction step
  Widget _buildInstructionStep(
      {required String stepNumber,
      required String title,
      required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.blueAccent,
          child: Text(
            stepNumber,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
