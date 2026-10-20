import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizProvider with ChangeNotifier {
  String _userName = '';
  int _score = 0;
  int _currentIndex = 0;
  bool _isDarkMode = false;

  // Data Dummy 5 Pertanyaan Kuis
  final List<Question> _questions = [
    Question(
      questionText: 'Apa nama ibu kota negara Indonesia saat ini?',
      options: ['Medan', 'Jakarta', 'Bandung', 'Surabaya'],
      correctAnswer: 'Jakarta',
    ),
    Question(
      questionText: 'Komponen dasar UI di Flutter yang tidak memiliki state disebut...',
      options: ['StatefulWidget', 'StatelessWidget', 'Provider', 'BuildContext'],
      correctAnswer: 'StatelessWidget',
    ),
    Question(
      questionText: 'Bahasa pemrograman utama yang digunakan dalam pengembangan Flutter adalah...',
      options: ['Java', 'Kotlin', 'Dart', 'Swift'],
      correctAnswer: 'Dart',
    ),
    Question(
      questionText: 'Fungsi utama dari Provider pada Flutter adalah...',
      options: ['Navigasi halaman', 'State Management', 'Koneksi Database', 'Render Animasi'],
      correctAnswer: 'State Management',
    ),
    // Ini Pertanyaan ke-5 yang baru ditambahkan
    Question(
      questionText: 'Widget yang digunakan untuk menyusun elemen secara vertikal (dari atas ke bawah) di Flutter adalah...',
      options: ['Row', 'Stack', 'Column', 'Container'],
      correctAnswer: 'Column',
    ),
  ];

  // Getters untuk mengambil data
  String get userName => _userName;
  int get score => _score;
  int get currentIndex => _currentIndex;
  bool get isDarkMode => _isDarkMode;
  List<Question> get questions => _questions;
  bool get isQuizFinished => _currentIndex >= _questions.length;

  // Actions (Fungsi untuk mengubah data)
  void setUserName(String name) {
    _userName = name;
    notifyListeners(); // Memperbarui tampilan secara otomatis
  }

  void answerQuestion(String selectedAnswer) {
    // Mengecek apakah jawaban benar
    // Karena ada 5 soal, maka tiap soal bernilai 20 poin (5 x 20 = Total 100 poin)
    if (selectedAnswer == _questions[_currentIndex].correctAnswer) {
      _score += 20;
    }
    _currentIndex++; // Lanjut ke soal berikutnya
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode; // Mengubah tema gelap/terang
    notifyListeners();
  }

  void resetQuiz() {
    _score = 0;
    _currentIndex = 0;
    _userName = '';
    notifyListeners();
  }
}