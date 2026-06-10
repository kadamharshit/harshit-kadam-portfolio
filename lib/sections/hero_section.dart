import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web/web.dart' as web;

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  const HeroSection({super.key, required this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      height: isMobile ? 600 : 700,
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: isMobile ? 60 : 80,
            backgroundImage: AssetImage('assets/profile/profile.jpg'),
          ),
          const SizedBox(height: 30),

          Text(
            "Harshit Kadam",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 42 : 64,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            "Flutter Developer | Building scalable mobile applications with Flutter, SQLite, Supabase and Firebase.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: isMobile ? 18 : 24, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          isMobile
              ? Column(
                  children: [
                    ElevatedButton(
                      onPressed: onViewProjects,
                      child: const Text("View Projects"),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: _downloadResume,
                      child: const Text("Download Resume"),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: onViewProjects,
                      child: const Text("View Projects"),
                    ),
                    const SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: _downloadResume,
                      child: const Text("Download Resume"),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

Future<void> _downloadResume() async {
  try {
    final byteData = await rootBundle.load(
      'assets/resume/Harshit Deepak Kadam_Mobile.pdf',
    );
    final bytes = byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );

    final blob = web.Blob([bytes.toJS].toJS);

    final url = web.URL.createObjectURL(blob);

    final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = 'Harshit_Kadam_Mobile.pdf';

    anchor.click();

    // 6. Clean up memory
    web.URL.revokeObjectURL(url);
  } catch (e) {
    debugPrint('Error triggering download: $e');
  }
}
