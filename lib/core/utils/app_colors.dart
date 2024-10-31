import 'package:flutter/material.dart';

class AppColors {
  // Definisikan warna utama yang akan digunakan
  static const Color primaryColor = Color(0xFFD1F272);
  static const Color secondaryColor = Color(0xFF2F2F2F);

  // Warna latar belakang dan teks
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF212121);

  // Warna status (sukses, peringatan, kesalahan)
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color errorColor = Color(0xFFF44336);

  // Warna khusus opacity atau variasi dari warna utama
  static Color primaryColorLight(double opacity) {
    return primaryColor.withOpacity(opacity);
  }

  static Color secondaryColorLight(double opacity) {
    return secondaryColor.withOpacity(opacity);
  }
}
