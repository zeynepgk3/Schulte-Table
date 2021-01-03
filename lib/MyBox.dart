import 'package:flutter/material.dart';
class MyBox extends StatelessWidget {
  int number;
  bool isFound;

  MyBox({this.number, this.isFound});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: (isFound)
            ? Container(
          child: Text(""),
        )
            : Container(
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          color: Colors.orange,
          width: 60,
          height: 60,
        ),
      ),
      //   color: Colors.blue,
    );
  }
}