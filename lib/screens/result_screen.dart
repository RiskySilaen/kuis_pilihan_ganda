import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Menentukan warna piala berdasarkan skor
    Color trophyColor;
    String feedbackText;
    if (provider.score == 100) {
      trophyColor = Colors.amber;
      feedbackText = "Sempurna! Kamu hebat!";
    } else if (provider.score >= 50) {
      trophyColor = Colors.blueAccent;
      feedbackText = "Kerja bagus!";
    } else {
      trophyColor = Colors.grey;
      feedbackText = "Jangan menyerah, coba lagi!";
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Efek Cahaya di belakang Piala
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: trophyColor.withOpacity(0.1),
                ),
                child: Icon(Icons.emoji_events, size: 120, color: trophyColor),
              ),
              const SizedBox(height: 30),
              Text(
                feedbackText,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${provider.userName}, Skor Kamu:',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Kotak Skor
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [Colors.blue[900]!, Colors.purple[900]!]
                        : [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Text(
                  '${provider.score} / 100',
                  style: GoogleFonts.poppins(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                text: 'Main Lagi',
                icon: Icons.refresh,
                onPressed: () {
                  provider.resetQuiz();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}