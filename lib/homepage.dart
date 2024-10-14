import 'package:flutter/material.dart';
import 'package:tugas2/rekomendasi.dart';
import 'package:tugas2/stopwatch.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuButton(context,
                    icon: Icons.person_2_outlined,
                    label: 'Daftar Anggota',
                    onPressed: () {})
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuButton(context, icon: Icons.timer, label: 'Stopwatch',
                    onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StopwatchApp()));
                })
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuButton(context,
                    icon: Icons.recommend_outlined,
                    label: 'Rekomendasi', onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rekomendasi()));
                })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 50,
          onPressed: onPressed,
          color: Colors.blueAccent,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
