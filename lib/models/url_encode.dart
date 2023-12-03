// ignore: camel_case_types
class urlEn {
  static Function encodeUrl = (String size, String data) {
    var boyut = "size=${size}x$size";
    var veri = "data=$data";
    var veriler = "$boyut&$veri";
    var sifreliVeri = "";
    for (int i = 0; i < veriler.length; i++) {
      if (veriler[i] == " ") {
        sifreliVeri += "+";
      } else if (veriler[i] == "&") {
        sifreliVeri += veriler[i];
      } else if (veriler[i] == "=") {
        sifreliVeri += "=";
      } else {
        sifreliVeri += (Uri.encodeComponent(veriler[i]).toString());
      }
    }
    return sifreliVeri;
  };
}
