

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_qr/constants/constans.dart';
import 'package:flutter_qr/constants/ui_helper.dart';

class HomeForm extends StatefulWidget {

  late final Function onPressedCreateQR;
  // ignore: prefer_const_constructors_in_immutables
  HomeForm({required this.onPressedCreateQR,super.key});

  @override
  State<HomeForm> createState() => HomeFormState();
}

class HomeFormState extends State<HomeForm> {
  var control1;
  var control2;
  var focus = false;

  @override
  void initState() {
    control1 = TextEditingController();
    control2 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    control1.dispose();
    control2.dispose();
    super.dispose();
  }

  String data = "";
  String size = "";
  var myBorderInput = UnderlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(80)),
      borderSide: BorderSide(width: 3, color: constants.backgroundcolor));

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Form(
          key: formKey,
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blueGrey, Colors.white],
                      ),
                      borderRadius: BorderRadius.circular(80)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 34,right: 16),
                    child: myTextField1(context),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: (MediaQuery.of(context).size.width / 6),
                      left: (MediaQuery.of(context).size.width / 6)),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blueGrey, Colors.white],
                      ),
                      borderRadius: BorderRadius.circular(80)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 34,right: 16),
                    child: myTextfield2(),
                  ),
                )
              ],
            ),
          )),
      Positioned(
          left: MediaQuery.of(context).size.width / 2 - 41,
          bottom: MediaQuery.of(context).size.height / 2 - 25,
          child: Container(
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
                color: constants.AnaRenk,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              icon: Icon(Icons.qr_code_rounded,
                  size: MediaQuery.of(context).size.width / 6),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  
                  setState(() {
                    formKey.currentState!.save();
                    ui_helper.data = data;
                    ui_helper.size = size;
                    focus = false;
                    widget.onPressedCreateQR();
                  });
                }
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
          )),
    ]);
  }

  TextFormField myTextfield2() {
    return TextFormField(
                  autofocus: focus,
                  keyboardType: TextInputType.number,
                  style: constants.formTextStyle,
                  decoration: InputDecoration(
                    focusColor: constants.AnaRenk,
                    fillColor: constants.AnaRenk,
                    hoverColor: constants.AnaRenk,
                    labelText: 
                      "Size",
                      
                    hintText: "Enter the QR size.",
                    border: myBorderInput,
                    enabledBorder: myBorderInput,
                    focusedBorder: myBorderInput,
                    disabledBorder: myBorderInput,
                    errorBorder: myBorderInput,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The size cannot be empty!";
                    }
                    return null;
                  },
                  onSaved: (newValue) => size = newValue!,
                );
  }

  TextFormField myTextField1(BuildContext context) {
    return TextFormField(
                  autofocus: focus,
                  controller: control2,
                  style: constants.formTextStyle,
                  decoration: InputDecoration(
                    focusColor: constants.AnaRenk,
                    fillColor: constants.AnaRenk,
                    hoverColor: constants.AnaRenk,
                    labelText: 
                      "Content",
                     
                    
                    border: myBorderInput,
                    enabledBorder: myBorderInput,
                    focusedBorder: myBorderInput,
                    disabledBorder: myBorderInput,
                    errorBorder: myBorderInput,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The content cannot be empty!";
                    }
                    return null;
                  },
                  onSaved: (newValue) => data = newValue!,
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: constants.backgroundcolor,
                            title: Text("CREAT CONTENT",
                                style: constants.TitleStyle),
                            content: Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Colors.blueGrey, Colors.white],
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: textfieldDialog(),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .pop(control1.text);
                                      control2 = control1;
                                    });
                                  },
                                  child: Text(
                                    "CREATE",
                                    style: constants.formsubStyle,
                                  ))
                            ],
                          )),
                );
  }

  TextField textfieldDialog() {
    return TextField(
                                autofocus: true,
                                controller: control1,
                                maxLines: 15,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 3,
                                            color:
                                                constants.backgroundcolor)),
                                    disabledBorder: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 3,
                                            color:
                                                constants.backgroundcolor)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 3,
                                            color:
                                                constants.backgroundcolor)),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            width: 3,
                                            color:
                                                constants.backgroundcolor))));
  }
}
