import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_button.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, child) {
        if (provider.isQuizFinished) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ResultScreen()),
            );
          });
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final currentQuestion = provider.questions[provider.currentIndex];
        final progress = (provider.currentIndex + 1) / provider.questions.length;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Soal ${provider.currentIndex + 1} / ${provider.questions.length}',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: isDark ? Colors.grey[800] : Colors.blue[100],
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 30),
                // Card Pertanyaan
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[850] : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    currentQuestion.questionText,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                // Pilihan Jawaban
                Expanded(
                  child: ListView.builder(
                    itemCount: currentQuestion.options.length,
                    itemBuilder: (context, index) {
                      final option = currentQuestion.options[index];

                      // Logika Penentuan Warna (Benar = Hijau, Salah = Merah)
                      bool isCorrectAnswer = option == currentQuestion.correctAnswer;
                      bool isSelected = option == provider.lastSelectedAnswer;

                      Color borderColor = isDark ? Colors.grey[700]! : Colors.blue[100]!;
                      Color bgColor = isDark ? Colors.grey[800]! : Colors.white;
                      IconData iconData = Icons.circle_outlined;
                      Color iconColor = isDark ? Colors.grey[400]! : Colors.blueAccent;

                      if (provider.hasAnsweredCurrent) {
                        if (isCorrectAnswer) {
                          borderColor = Colors.green;
                          bgColor = Colors.green.withOpacity(0.15);
                          iconData = Icons.check_circle;
                          iconColor = Colors.green;
                        } else if (isSelected) {
                          borderColor = Colors.red;
                          bgColor = Colors.red.withOpacity(0.15);
                          iconData = Icons.cancel;
                          iconColor = Colors.red;
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: InkWell(
                          onTap: provider.hasAnsweredCurrent
                              ? null // Matikan tombol jika sudah dijawab
                              : () => provider.answerQuestion(option),
                          borderRadius: BorderRadius.circular(16),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: borderColor, width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(iconData, color: iconColor),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Munculkan Box Penjelasan & Tombol Lanjut JIKA sudah dijawab
                if (provider.hasAnsweredCurrent) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: provider.isLastAnswerCorrect
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: provider.isLastAnswerCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              provider.isLastAnswerCorrect ? Icons.check_circle : Icons.cancel,
                              color: provider.isLastAnswerCorrect ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              provider.isLastAnswerCorrect ? 'Jawaban Benar!' : 'Jawaban Salah!',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: provider.isLastAnswerCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          currentQuestion.explanation,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Lanjut ke Soal Berikutnya',
                    icon: Icons.arrow_forward,
                    onPressed: () {
                      provider.nextQuestion();
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}