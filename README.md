# Aplikasi Kuis Pilihan Ganda IKLC - UTS Pemrograman Mobile

Aplikasi ini adalah kuis interaktif berbasis Flutter yang dikembangkan untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile. Aplikasi dirancang dengan antarmuka yang modern, responsif, dan mengimplementasikan *Best Practices* dalam pengembangan aplikasi Flutter.

---

## 👨‍💻 Identitas Mahasiswa
- **Nama** : Risky Jonalson Silaen
- **NIM**  : 241401010
- **Lab**  : Pemrograman Mobile (PM 1 & PM 3)

---

## 📱 Informasi Aplikasi
- **Nama Aplikasi**: Kuis IKLC
- **Deskripsi**: Aplikasi kuis pilihan ganda yang menguji pengetahuan seputar dasar-dasar Flutter. Aplikasi ini memiliki fitur interaktif seperti validasi input nama, umpan balik (feedback) jawaban beserta penjelasannya, serta perhitungan skor dinamis di akhir sesi.

### ✨ Fitur-Fitur Utama (Sesuai Kriteria UTS):
1. **Navigasi & Multi-Halaman**: Terdiri dari 3 halaman utama (`HomeScreen`, `QuizScreen`, `ResultScreen`).
2. **State Management (Provider)**: Menggunakan package `provider` untuk menjaga agar data kuis, progres soal, dan skor *tidak hilang/reset* meskipun layar perangkat dirotasi (mendukung rotasi *Portrait* ke *Landscape*).
3. **Reusable Widget & UI Dinamis**: Memiliki komponen tombol kustom (`CustomButton`) yang lebarnya dikonfigurasi menggunakan `MediaQuery` agar responsif pada berbagai ukuran layar.
4. **Interactive Feedback (Bonus)**: Memberikan warna indikator (Hijau/Merah) beserta kotak penjelasan edukatif setiap kali pengguna selesai memilih jawaban.
5. **Dark/Light Mode (Bonus)**: Memiliki fitur pergantian tema dari *Light Mode* ke *Dark Mode* untuk kenyamanan visual.
6. **Desain Modern**: Menggunakan font kustom (`google_fonts` - Poppins) dan elemen UI modern (bayangan, radius sudut, transisi warna).

---

## 📂 Struktur Utama Kodingan
- `lib/models/question.dart`: Blueprint atau model data untuk pertanyaan, opsi jawaban, jawaban benar, dan penjelasan.
- `lib/providers/quiz_provider.dart`: Otak logika aplikasi (State Management).
- `lib/screens/`: Berisi antarmuka pengguna (`home_screen.dart`, `quiz_screen.dart`, `result_screen.dart`).
- `lib/widgets/custom_button.dart`: Komponen tombol *reusable*.

---

## 📸 Dokumentasi
*Catatan: Screenshot aplikasi dapat dilihat pada folder `docs/screenshots/`*

- **Halaman Beranda (Home Screen)**
  
     Light Mode
<img width="390" height="657" alt="image" src="https://github.com/user-attachments/assets/8de67150-8139-4d38-9dce-7f25e5b92722" />
     Dark Mode <img width="360" height="656" alt="image" src="https://github.com/user-attachments/assets/cbb51066-d9bf-4c19-a22a-7e7a7f32a628" />


- **Halaman Kuis (Quiz Screen)**
  ![Quiz Screen](docs/screenshots/quiz_screen.png)

- **Halaman Hasil (Result Screen)**
  ![Result Screen](docs/screenshots/result_screen.png)

---

## 🔗 Tautan Penting & Kredit

- **Video Presentasi Demo & Kodingan**: 
  [👉 Klik di sini untuk menonton Video Presentasi (Google Drive) 👈](MASUKKAN_LINK_GOOGLE_DRIVE_KAMU_DI_SINI)

- **Link Mockup / Prototype**: 
  - *(Tidak ada mockup eksternal, desain UI langsung diimplementasikan ke dalam kode Flutter dengan kustomisasi CSS-like).*

- **Kredit Aset**: 
  - Logo Aplikasi (Assets): [Quiz icons created by Magnific - Flaticon](https://www.flaticon.com/free-icons/quiz)
  - Font: [Google Fonts - Poppins](https://fonts.google.com/specimen/Poppins)
