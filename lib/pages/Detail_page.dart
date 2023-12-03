// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_qr/constants/constans.dart';
import 'package:flutter_qr/widgets/dowload.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_qr/models/url_create.dart';
import 'package:flutter_qr/constants/ui_helper.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    String gecici = ui_helper.data;
    String gecici2 = ui_helper.size;
    String url = createUrl.createURL(gecici2, gecici);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueGrey, Colors.white],
        )),
        child: Stack(
          children: [
            Positioned(
                left: MediaQuery.of(context).size.width / 2 - 109,
                top: MediaQuery.of(context).size.height / 6,
                child: GradientText(
                  "Here is your QR!",
                  style: constants.TitleAppStyle,
                  colors: const [Colors.white, Colors.black],
                )),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Hero(
                  tag: "QR",
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/qr_wait.gif",
                    image: url,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 6,
                left: 10,
                child: Text(
                  "You can fit everything into this code,",
                  style: constants.DetailPageInfoStyle,
                )),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 8,
                right: 5,
                child: Text(
                  "even the world...",
                  style: constants.DetailPageInfoStyle,
                )),
            Positioned(
              bottom: 5,
              child: SizedBox(
                  width: 170,
                  height: 100,
                  child: Column(
                    children: [
                      const DownloadButton(),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: GradientText(
                          "Download QR.",
                          colors: const [Colors.white, Colors.black],
                          style: constants.DetailPageInfoStyle,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
