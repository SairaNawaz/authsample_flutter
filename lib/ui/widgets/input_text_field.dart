import 'package:flutter/material.dart';

import '../constants.dart';

class InputTextField extends StatefulWidget {
  String hint;
  TextEditingController controller;
  bool isEmail;
  bool isPassword;
  IconData iconData;

  InputTextField(
      {required this.hint,
      required this.controller,
      required this.iconData,
      this.isPassword = false,
      this.isEmail = false});

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool isEmptyValidated = true;
  bool isEmailValidated = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Container(
              height: 70,
              child: Card(
                elevation: 8,
                child: TextFormField(
                  textCapitalization: TextCapitalization.none,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: widget.isPassword,
                  onChanged: (v) {
                    fieldValidation(v);
                  },
                  onFieldSubmitted: (v) {
                    fieldValidation(v);
                  },
                  controller: widget.controller,
                  validator: (v) {
                    return fieldValidation(v!);
                  },
                  decoration: InputDecoration(
                      errorText: "",
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      suffixIcon: widget.iconData != null
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                              child: Icon(
                                widget.iconData,
                                color: Colors.grey,
                              ),
                            )
                          : null,
                      hintText: widget.hint,
                      hintStyle: style_InputHintText,
                      border: InputBorder.none),
                ),
              ),
            ),
            !isEmptyValidated || !isEmailValidated
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
                        child: Text(
                          !isEmailValidated
                              ? "Enter Valid Email"
                              : "Required Field",
                          style: style_InputErrorText,
                        )),
                  )
                : Container()
          ],
        ));
  }

  String? fieldValidation(String v) {
    setState(() {
      isEmailValidated = widget.isEmail ? v.isValidEmail() : true;
      isEmptyValidated = v.isNotEmpty;
    });
    return isEmailValidated && isEmptyValidated ? null : "";
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
