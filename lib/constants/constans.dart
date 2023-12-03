// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class constants {
  constants._();
  static Color AnaRenk = const Color.fromARGB(255, 20, 58, 77);
  static Color backgroundcolor = const Color.fromARGB(255, 252, 252, 252);
  static const String subtitle = "Turn the world into QR code...";
  static const String title = "QR CREATOR";

  static TextStyle textStyle(
          double size, FontWeight fontWeight, Color colorName) =>
      GoogleFonts.quicksand(
          fontWeight: fontWeight, fontSize: size, color: colorName);

  static TextStyle TitleStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 24, color: AnaRenk);
  static TextStyle TitleAppStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 28, color: backgroundcolor);
  static TextStyle SubtitleStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w600, fontSize: 16, color: AnaRenk);
  static TextStyle formTextStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w600, fontSize: 16, color: backgroundcolor);
  static TextStyle formsubStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w600, fontSize: 16, color: AnaRenk);
  static TextStyle qrStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 24, color: AnaRenk);
  static TextStyle detailStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 24, color: AnaRenk);
  static TextStyle miniStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w600, fontSize: 20, color: AnaRenk);
  static TextStyle DetailStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 34, color: backgroundcolor);
  static TextStyle DetailPageInfoStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w900, fontSize: 20, color: AnaRenk);
}
