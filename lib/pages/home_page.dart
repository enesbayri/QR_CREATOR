import 'package:flutter/material.dart';
import 'package:flutter_qr/constants/constans.dart';
import 'package:flutter_qr/widgets/code_create.dart';
import 'package:flutter_qr/widgets/home_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key key1 = GlobalKey<HomeFormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: constants.backgroundcolor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueGrey, Colors.white],
        )),
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constants.AnaRenk,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(190),
                    bottomRight: Radius.circular(180))),
          ),
          Positioned(
              left: 15,
              top: 40,
              child: Text(
                constants.title,
                style: constants.TitleAppStyle,
              )),
          HomeForm(onPressedCreateQR: () {
            setState(() {});
          }),
          Align(
            key:UniqueKey(),
            alignment: Alignment.bottomCenter, child: const CodeCreate())
        ]),
      ),
    );
  }
}
