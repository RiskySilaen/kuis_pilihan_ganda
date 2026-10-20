import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    // Membungkus aplikasi dengan Provider agar state tersimpan saat layar dirotasi
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Memanggil provider untuk mendengarkan perubahan tema
    final quizProvider = Provider.of<QuizProvider>(context);

    return MaterialApp(
      title: 'Aplikasi Kuis IKLC',
      debugShowCheckedModeBanner: false,
      // Konfigurasi Tema (Bonus Kriteria: Light & Dark Mode)
      themeMode: quizProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      // Halaman pertama yang muncul saat aplikasi dibuka
      home: const HomeScreen(),
    );
  }
}