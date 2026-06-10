class Project {
  final String title;
  final String description;
  final List<String> techStack;
  final String imagePath;
  final String githubUrl;
  final String? demoUrl;

  Project({
    required this.title,
    required this.description,
    required this.techStack,
    required this.imagePath,
    required this.githubUrl,
    this.demoUrl,
  });
}
