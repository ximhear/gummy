
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gummy/PopMenuButton.dart';
import 'package:gummy/icons/g_icons_icons.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }
class GRow extends StatefulWidget {
  GRow({Key key, this.onMenuPressed, this.menus}) : super(key: key);

  final PopMenuButtonCallback onMenuPressed;
  final List<String> menus;

  @override
  _GRowState createState() => _GRowState();
}

class _GRowState extends State<GRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            side: BorderSide(color: Colors.black45)
      ),
        child: InkWell(
//          splashColor: Colors.red,
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
                              height: 35,
                            padding: EdgeInsets.only(top: 16),
//                              color: Colors.lightGreen,
                            child: Row(
                              children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.0,
                                                color: Colors.black12
                                            ),
                                        ),
                                        child: Image(image: AssetImage('images/france.png'))
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.black12
                                          ),
                                      ),
                                      child: Image(image: AssetImage('images/south-korea.png'))
                                  ),
                              ],
                            ),
                          ),
                        ),
                          PopupMenuButton<int>(
                              onSelected: (int result) {
                                  if (widget.onMenuPressed != null) {
                                      widget.onMenuPressed(result);
                                  }
                              },
                              itemBuilder: (BuildContext context) {

                                  if (widget.menus == null) {
                                      return <PopupMenuEntry<int>>[];
                                  }
                                  return List.generate(widget.menus.length, (index) {
                                      return PopupMenuItem<int>(
                                          value: index,
                                          child: Text(widget.menus[index]),
                                      );
                                  });
                              }
                          ),
                      ],
                    ),
                  ),
                    Container(
//                        color: Colors.blueAccent,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                                Text(
                                    '해커스 토익',
                                    style: TextStyle(fontSize: 24,
                                        color: Colors.black54,
                                    ),
                                ),
                                Text(
                                    ' 100',
                                    style: TextStyle(fontSize:  14,
                                    color: Colors.black26),
                                ),
                            ],
                        )
                    ),
                ],
              )),
          onTap: () {
            debugPrint("row clicked");
          },
        ),
      ),
    );
  }
}
