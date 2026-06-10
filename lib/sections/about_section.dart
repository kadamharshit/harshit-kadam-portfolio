import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 50 : 80,
      ),
      child: Column(
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              "I am an IT Engineering student and Flutter Developer "
              "with experience in building mobile applications using Flutter, "
              "SQLite, Supabase, Firebase and REST APIs.\n\n"
              "3 Months Industry Experience as Flutter App Development Intern.\n\n"
              "I enjoy developing practical solutions such as WalletWatch, "
              "Block Pass, NeuroNote and IoT Weather Reporting systems. "
              "My interests include mobile application development, UI/UX design, "
              "database management and creating user-friendly digital experiences.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                height: 1.8,
                color: Colors.white70,
              ),
            ),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _infoCard("4+", "Projects", isMobile),
              _infoCard("Flutter", "Development", isMobile),
              _infoCard("SQLite", "Database", isMobile),
              _infoCard("Flutter", "Industry Experience", isMobile),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _infoCard(String title, String subtitle, bool isMobile) {
  return Container(
    width: isMobile ? 150 : 180,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withOpacity(0.1)),
    ),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    ),
  );
}
