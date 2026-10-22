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
                                                                                
<img width="390" height="657" alt="image" src="https://github.com/user-attachments/assets/8de67150-8139-4d38-9dce-7f25e5b92722" /> 
<img width="360" height="656" alt="image" src="https://github.com/user-attachments/assets/cbb51066-d9bf-4c19-a22a-7e7a7f32a628" />


- **Halaman Kuis (Quiz Screen)**
<img width="327" height="638" alt="image" src="https://github.com/user-attachments/assets/6cd688e6-deef-4bc0-89ef-e36128e97238" />
<img width="333" height="647" alt="image" src="https://github.com/user-attachments/assets/f15423a7-70b5-417f-8ea5-c7ec73a1fb3f" />
<img width="313" height="640" alt="image" src="https://github.com/user-attachments/assets/b7740e2c-138b-426a-b764-90d735a92616" />


- **Halaman Hasil (Result Screen)**
<img width="318" height="636" alt="image" src="https://github.com/user-attachments/assets/b7c16cdf-dd3f-4892-96dd-f9553f1f7786" />
<img width="331" height="651" alt="image" src="https://github.com/user-attachments/assets/9b20c7ec-afd4-440e-b87e-b89348a8ae6a" />


---

## 🔗 Tautan Penting & Kredit

- **Video Presentasi Demo & Kodingan**: https://drive.google.com/drive/folders/1qvjRApEAgj4auIj096JO9DuxeIgRpcZo?usp=sharing

- **Link Mockup / Prototype**: 
  - *(Tidak ada mockup eksternal, desain UI langsung diimplementasikan ke dalam kode Flutter dengan kustomisasi CSS-like).*

- **Kredit Aset**: 
  - Logo Aplikasi (Assets): [Quiz icons created by Magnific - Flaticon](https://www.flaticon.com/free-icons/quiz)
  - Font: [Google Fonts - Poppins](https://fonts.google.com/specimen/Poppins)
