import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isEnabled;

  CustomButton(
      {required this.title, required this.onPressed, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Container(
          //width: MediaQuery.of(context).size.width / 3,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isEnabled ? Colors.green : Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  offset: Offset(0.0, 1.5),
                  blurRadius: 10,
                ),
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onPressed,
                child: Center(
                  child: Text(
                    title,
                    style: isEnabled
                        ? style_ButtonNormalTextWhite
                        : style_ButtonNormalTextWhite,
                  ),
                )),
          ),
        ));
  }
}
