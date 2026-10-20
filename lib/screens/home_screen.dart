import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_button.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tuliskan namamu dulu ya!', style: GoogleFonts.poppins()),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    Provider.of<QuizProvider>(context, listen: false)
        .setUserName(_nameController.text.trim());

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const QuizScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // --- PERUBAHAN: Tombol dipindah ke AppBar agar mentok ke atas ---
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                quizProvider.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                color: quizProvider.isDarkMode ? Colors.amber : Colors.indigo,
                size: 28,
              ),
              onPressed: () {
                quizProvider.toggleTheme();
              },
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true, // Agar layout tetap penuh ke layar
      // ----------------------------------------------------------------

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Efek bayangan pada logo
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[850] : Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.quiz, size: 80, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Kuis IKLC',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.indigo[900],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tantang dirimu dan lihat seberapa jauh\npengetahuan komputermu!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                // TextField yang lebih modern
                TextField(
                  controller: _nameController,
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Siapa namamu?',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                    prefixIcon: const Icon(Icons.person_outline, color: Colors.blueAccent),
                    filled: true,
                    fillColor: isDark ? Colors.grey[800] : Colors.blue[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'MULAI SEKARANG',
                  icon: Icons.rocket_launch,
                  onPressed: _startQuiz,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}