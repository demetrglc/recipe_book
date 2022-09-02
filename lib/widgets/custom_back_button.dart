import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color.fromARGB(0, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(137, 255, 255, 255),
              blurRadius: 4,
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
