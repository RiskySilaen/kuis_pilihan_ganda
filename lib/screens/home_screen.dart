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
    // Validasi agar nama tidak boleh kosong
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan masukkan nama Anda terlebih dahulu!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Menyimpan nama pengguna ke Provider
    Provider.of<QuizProvider>(context, listen: false)
        .setUserName(_nameController.text.trim());

    // Navigasi pindah ke halaman kuis
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis IKLC', style: GoogleFonts.poppins()),
        actions: [
          // Tombol Bonus: Ganti Tema Dark/Light Mode
          IconButton(
            icon: Icon(
              quizProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              quizProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menampilkan aset gambar logo
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.quiz, size: 100, color: Colors.blue);
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Selamat Datang!',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Silakan masukkan nama Anda untuk memulai kuis.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              // Kolom input nama pengguna
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 24),
              // Memanggil reusable widget CustomButton
              CustomButton(
                text: 'Mulai Kuis',
                onPressed: _startQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}