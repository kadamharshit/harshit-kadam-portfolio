import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            "Skills",
            style: TextStyle(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _skillCard(
                title: "Mobile Development",
                skills: ["Flutter", "Dart"],
                isMobile: isMobile,
              ),
              _skillCard(
                title: "Backend & Database",
                skills: ["SQLite", "Supabase", "Firebase", "REST APIs"],
                isMobile: isMobile,
              ),
              _skillCard(
                title: "Tools & Platforms",
                skills: ["Git", "GitHub", "VS Code"],
                isMobile: isMobile,
              ),
              _skillCard(
                title: "Specialized Technologies",
                skills: ['Blockchain', 'Solidity', 'Ethereum', 'IoT', 'ESP32'],
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _skillCard({
  required String title,
  required List<String> skills,
  required bool isMobile,
}) {
  return Container(
    width: isMobile ? double.infinity : 300,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withOpacity(0.1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        ...skills.map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Icon(Icons.check_circle, size: 18),
                const SizedBox(width: 10),
                Text(skill),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
