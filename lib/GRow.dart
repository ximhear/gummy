
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gummy/icons/g_icons_icons.dart';

class GRow extends StatefulWidget {
  @override
  _GRowState createState() => _GRowState();
}

class _GRowState extends State<GRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.green,
//              padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(16.0)
          ),
        ),
        child: Material(
//          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: InkWell(
            splashColor: Colors.red,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
//                      color: Colors.cyan,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 16),
//                              color: Colors.lightGreen,
                              child: Text('Title'),
                            ),
                          ),
                          Container(
//                            color: Colors.red,
                            child: RawMaterialButton(
                              constraints: BoxConstraints(
                                  minHeight: 0, minWidth: 0),
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.fromLTRB(16, 8, 0, 20),
                              onPressed: () {
                                print("menu clicked");
                              },
                              child: Container(
//                                color: Colors.purple,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
//                                            mainAxisAlignment: MainAxisAlignment.start,
//                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
//                                        color: Colors.red,
                                        child: Icon(
                                          GIcons.primitive_dot,
                                          color: Colors.red,
                                          size: 10,
                                        )),
                                    Container(
//                                        color: Colors.red,
                                        child: Icon(
                                          GIcons.primitive_dot,
                                          color: Colors.red,
                                          size: 10,
                                        )),
                                    Container(
                                        child: Icon(
                                          GIcons.primitive_dot,
                                          color: Colors.red,
                                          size: 10,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
//                        color: Colors.blueAccent,
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                            'sdjfls sdj flsdj lsdj lsjdfl sjdlfj sdljf lsdjf lsdjf ljfsl Entry Hello, Hello l Entry Hello, Hello lEntry Hello, Hello lEntry Hello, Hello lEntry Hello, Hello lEntry Hello, Hello l x')),
                  ],
                )),
            onTap: () {
              debugPrint("row clicked");
            },
          ),
        ),
      ),
    );
  }
}
