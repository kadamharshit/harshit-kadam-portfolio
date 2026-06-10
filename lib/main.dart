import 'package:flutter/material.dart';
import 'package:portfolio_flutter/sections/footer_section.dart';

import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Harshit Kadam Portfolio",
      theme: ThemeData.dark(),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  final scrollController = ScrollController();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox;

    final offset =
        box.localToGlobal(Offset.zero).dy + scrollController.offset - 90;

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Harshit Kadam",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: isMobile
            ? [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'About':
                        scrollToSection(aboutKey);
                        break;
                      case 'Skills':
                        scrollToSection(skillsKey);
                        break;
                      case 'Projects':
                        scrollToSection(projectsKey);
                        break;
                      case 'Contact':
                        scrollToSection(contactKey);
                        break;
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'About', child: Text('About')),
                    PopupMenuItem(value: 'Skills', child: Text('Skills')),
                    PopupMenuItem(value: 'Projects', child: Text('Projects')),
                    PopupMenuItem(value: 'Contact', child: Text('Contact')),
                  ],
                ),
              ]
            : [
                TextButton(
                  onPressed: () => scrollToSection(aboutKey),
                  child: const Text('About'),
                ),
                TextButton(
                  onPressed: () => scrollToSection(skillsKey),
                  child: const Text('Skills'),
                ),
                TextButton(
                  onPressed: () => scrollToSection(projectsKey),
                  child: const Text('Projects'),
                ),
                TextButton(
                  onPressed: () => scrollToSection(contactKey),
                  child: const Text('Contact'),
                ),
              ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            HeroSection(onViewProjects: () => scrollToSection(projectsKey)),
            Container(key: aboutKey, child: const AboutSection()),
            Container(key: skillsKey, child: const SkillsSection()),
            Container(key: projectsKey, child: const ProjectsSection()),
            Container(key: contactKey, child: const ContactSection()),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
