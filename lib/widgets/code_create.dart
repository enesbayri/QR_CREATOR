

import 'package:flutter/material.dart';
import 'package:flutter_qr/constants/constans.dart';
import 'package:flutter_qr/constants/ui_helper.dart';
import 'package:flutter_qr/models/url_create.dart';
import 'package:flutter_qr/pages/Detail_page.dart';

class CodeCreate extends StatefulWidget {
  const CodeCreate({super.key});

  @override
  State<CodeCreate> createState() => _CodeCreateState();
}

class _CodeCreateState extends State<CodeCreate> {
  @override
  Widget build(BuildContext context) {
    String gecici = ui_helper.data;
    String gecici2 = ui_helper.size;
    if (gecici == "" && gecici2 == "") {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Text(
          "Please enter the QR information!",
          style: constants.qrStyle,
        )),
      );
    } else {
      String url = createUrl.createURL(gecici2, gecici);
      return Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child:GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailPage(),
                    ));
                  },
                  child: SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Hero(
                    tag: "QR",
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/qr_wait.gif",
                      image: url,
                      fit: BoxFit.fill,
                    ),
                  ))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "QR SUCCESSFUL",
                    style: constants.detailStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Click to see the details...",
                      style: constants.miniStyle,
                    ),
                  )
                ]),
              ),
            ),
          ]),
        ),
      );
    }
  }
}
