import 'package:flutter_qr/models/url_encode.dart';

// ignore: camel_case_types
class createUrl {
  static String createURL(size, data) {
    // ignore: no_leading_underscores_for_local_identifiers
    String _qrCreater = "https://api.qrserver.com/v1/create-qr-code/?";
    String sonuc = _qrCreater + urlEn.encodeUrl(size, data);
    return sonuc;
  }
}
