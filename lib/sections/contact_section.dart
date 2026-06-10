import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: TextStyle(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "I'm currently looking for Flutter Developer opportunities.\n"
            "Feel free to reach out through any of the platforms below.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.8),
          ),

          const SizedBox(height: 50),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _contactCard(
                icon: FontAwesomeIcons.github,
                title: "GitHub",
                subtitle: "View my projects",
                onTap: () => _launchUrl("https://github.com/kadamharshit/"),
                isMobile: isMobile,
              ),

              _contactCard(
                icon: FontAwesomeIcons.linkedin,
                title: "LinkedIn",
                subtitle: "Connect with me",
                onTap: () => _launchUrl(
                  "https://www.linkedin.com/in/harshit-kadam-43b709204/",
                ),
                isMobile: isMobile,
              ),

              _contactCard(
                icon: Icons.email,
                title: "Email",
                subtitle: "Send a message",
                onTap: () => _launchUrl(
                  "https://mail.google.com/mail/?view=cm&fs=1&to=kadamharshit07@gmail.com",
                ),
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required bool isMobile,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: isMobile ? double.infinity : 250,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            FaIcon(icon, size: isMobile ? 32 : 40, color: Colors.white),

            const SizedBox(height: 15),

            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 20 : 22,
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
      ),
    );
  }
}
