
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_qr/pages/future_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const QrApp());
}

class QrApp extends StatelessWidget {
  const QrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //fixes keyboard not closing
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
          title: 'QR CREATOR',
          home: const futureHomePage(),
          builder: EasyLoading.init()),
    );
  }
}
