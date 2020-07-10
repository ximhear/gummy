import 'package:flutter/material.dart';

class GSection extends StatelessWidget {
    GSection({Key key, this.title}) : super(key: key);
   String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(title,
        style: TextStyle(
            color: Colors.black38,
            fontSize: 16,
            fontWeight: FontWeight.normal,
        ))
    );
  }
}
