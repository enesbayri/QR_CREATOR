
import 'package:flutter/material.dart';
import 'package:flutter_qr/constants/constans.dart';


class Acilis extends StatefulWidget {
  const Acilis({super.key});

  @override
  State<Acilis> createState() => _AcilisState();
}

class _AcilisState extends State<Acilis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constants.backgroundcolor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/Loading.gif")),
            Align(
              child: Text(
                constants.subtitle,
                style: constants.SubtitleStyle,
              ),
            ),
            Positioned(
              bottom: 20,
              left: (MediaQuery.of(context).size.width) / 2 - 81,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: constants.AnaRenk, width: 6)),
                  child: Text(constants.title, style: constants.TitleStyle)),
            ),
          ],
        ));
  }
}
