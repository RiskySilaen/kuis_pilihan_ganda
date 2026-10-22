import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizProvider with ChangeNotifier {
  String _userName = '';
  int _score = 0;
  int _currentIndex = 0;
  bool _isDarkMode = false;

  // State baru untuk fitur penjelasan
  bool _hasAnsweredCurrent = false;
  bool _isLastAnswerCorrect = false;
  String _lastSelectedAnswer = '';

  // Data 5 Pertanyaan dengan Penjelasannya
  final List<Question> _questions = [
    Question(
      questionText: 'Apa nama ibu kota negara Indonesia saat ini?',
      options: ['Medan', 'Jakarta', 'Bandung', 'Surabaya'],
      correctAnswer: 'Jakarta',
      explanation: 'Saat ini status ibu kota masih di Jakarta, sebelum pemindahan resmi ke IKN (Nusantara) selesai sepenuhnya.',
    ),
    Question(
      questionText: 'Komponen dasar UI di Flutter yang tidak memiliki state disebut...',
      options: ['StatefulWidget', 'StatelessWidget', 'Provider', 'BuildContext'],
      correctAnswer: 'StatelessWidget',
      explanation: 'StatelessWidget digunakan untuk membuat UI yang statis atau datanya tidak berubah setelah pertama kali dibuat.',
    ),
    Question(
      questionText: 'Bahasa pemrograman utama yang digunakan dalam pengembangan Flutter adalah...',
      options: ['Java', 'Kotlin', 'Dart', 'Swift'],
      correctAnswer: 'Dart',
      explanation: 'Flutter dibuat oleh Google menggunakan bahasa Dart karena performanya yang sangat cepat (mendukung kompilasi JIT dan AOT).',
    ),
    Question(
      questionText: 'Fungsi utama dari Provider pada Flutter adalah...',
      options: ['Navigasi halaman', 'State Management', 'Koneksi Database', 'Render Animasi'],
      correctAnswer: 'State Management',
      explanation: 'Provider adalah salah satu package State Management yang direkomendasikan untuk mengelola dan mendistribusikan data di dalam aplikasi.',
    ),
    Question(
      questionText: 'Widget yang digunakan untuk menyusun elemen secara vertikal (dari atas ke bawah) di Flutter adalah...',
      options: ['Row', 'Stack', 'Column', 'Container'],
      correctAnswer: 'Column',
      explanation: 'Column menyusun elemen secara vertikal (atas-bawah), sedangkan Row menyusunnya secara horizontal (kiri-kanan).',
    ),
  ];

  // Getters
  String get userName => _userName;
  int get score => _score;
  int get currentIndex => _currentIndex;
  bool get isDarkMode => _isDarkMode;
  List<Question> get questions => _questions;
  bool get isQuizFinished => _currentIndex >= _questions.length;

  // Getters untuk UI Feedback
  bool get hasAnsweredCurrent => _hasAnsweredCurrent;
  bool get isLastAnswerCorrect => _isLastAnswerCorrect;
  String get lastSelectedAnswer => _lastSelectedAnswer;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void answerQuestion(String selectedAnswer) {
    if (_hasAnsweredCurrent) return; // Mencegah user menjawab dua kali

    _lastSelectedAnswer = selectedAnswer;
    _hasAnsweredCurrent = true;

    if (selectedAnswer == _questions[_currentIndex].correctAnswer) {
      _score += 20;
      _isLastAnswerCorrect = true;
    } else {
      _isLastAnswerCorrect = false;
    }
    notifyListeners(); // Update UI untuk menampilkan penjelasan
  }

  // Fungsi baru untuk lanjut ke soal berikutnya
  void nextQuestion() {
    _currentIndex++;
    _hasAnsweredCurrent = false; // Reset status untuk soal berikutnya
    _lastSelectedAnswer = '';
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void resetQuiz() {
    _score = 0;
    _currentIndex = 0;
    _userName = '';
    _hasAnsweredCurrent = false;
    _lastSelectedAnswer = '';
    notifyListeners();
  }
}