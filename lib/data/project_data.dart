import '../models/project_model.dart';

final List<Project> projects = [
  Project(
    title: "Block Pass",
    description:
        "Blockchain-based event pass issuing and verification platform using smart contracts, QR codes, and Ethereum Sepolia testnet.",
    techStack: ["Flutter", "Supabase", "Solidity", "Ethereum", "Web3"],
    imagePath: "assets/projects/block_pass/passed_issued.jpeg",
    githubUrl: "https://github.com/kadamharshit/block-pass",
  ),

  Project(
    title: "NeuroNote",
    description:
        "AI-powered adaptive learning platform for neurodivergent students with attention tracking, lecture summarization, and intelligent flashcard interventions.",
    techStack: ["Flutter", "SQLite", "Supabase", "ML Kit", "Whisper AI"],
    imagePath: "assets/projects/neuro_note/home.jpeg",
    githubUrl: "https://github.com/kadamharshit/Neuro-Note",
  ),

  Project(
    title: "IoT Weather Reporting",
    description:
        "An IoT-based weather monitoring system that collects real-time temperature, humidity, air quality, and rainfall data from ESP32 sensors and displays it through a Flutter application using Supabase cloud storage.",
    techStack: ["Flutter", "ESP32", "Supabase", "Arduino", "IoT", "DHT11"],
    imagePath: "assets/projects/iot_weather_reporting/dashboard.png",
    githubUrl: "https://github.com/kadamharshit/weather_reporting",
    demoUrl: "https://youtu.be/Kt29DDtoVoQ?si=gJ_LM13KDRXOhbee",
  ),

  Project(
    title: "WalletWatch",
    description:
        "A smart personal finance management application that helps users track expenses, manage budgets, transfer funds between accounts, and synchronize financial data using an offline-first architecture.",
    techStack: ["Flutter", "SQLite", "Supabase", "Provider", "FL Chart"],
    imagePath: "assets/projects/wallet_watch/dashboard.jpeg",
    githubUrl: "https://github.com/kadamharshit/Wallet_Watch",
    demoUrl: "https://youtu.be/Q_iutGRDCeo?si=XItKNiI3T1L17xuO",
  ),
];
