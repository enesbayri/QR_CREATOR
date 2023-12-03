import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr/pages/home_page.dart';
import 'package:flutter_qr/pages/load.dart';

// ignore: camel_case_types
class futureHomePage extends StatefulWidget {
  const futureHomePage({super.key});

  @override
  State<futureHomePage> createState() => _futureHomePageState();
}

// ignore: camel_case_types
class _futureHomePageState extends State<futureHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else if (snapshot.hasError) {
            return const Text("404 ERROR");
          } else {
            return const Acilis();
          }
        },
        future: _getLoad());
  }

  Future<int> _getLoad() async {
    int sayi = await Future.delayed(const Duration(seconds: 6), (() => 1));
    return sayi;
  }
}
