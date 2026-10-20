import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Ukuran lebar tombol dibuat dinamis menyesuaikan ukuran layar HP
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.85, // Mengambil 85% lebar layar
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}