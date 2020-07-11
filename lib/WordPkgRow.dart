
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gummy/PopMenuButton.dart';
import 'package:gummy/icons/g_icons_icons.dart';
import 'package:gummy/main.dart';

class WordPkgRow extends StatefulWidget {
    WordPkgRow({Key key, this.title, this.count, this.source, this.target, this.onMenuPressed, this.menus}) : super(key: key);

  final PopMenuButtonCallback onMenuPressed;
  final List<GMenuItem> menus;
  final String title;
  final String source;
  final String target;
  final int count;

  @override
  _WordPkgRowState createState() => _WordPkgRowState();
}

class _WordPkgRowState extends State<WordPkgRow> {
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
                              height: 40,
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
                                        child: languageImage(widget.source),
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: Colors.black12
                                          ),
                                      ),
                                      child: languageImage(widget.target),
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
                                          value: widget.menus[index].value,
                                          child: Text(widget.menus[index].title),
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
                                    widget.title,
                                    style: TextStyle(fontSize: 24,
                                        color: Colors.black54,
                                    ),
                                ),
                                Text(
                                    ' ${widget.count}',
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

  Image languageImage(String code) {
      if (code == "en-US") {
          return Image(image: AssetImage('images/united-states.png'));
      }
      else if (code == "ja-JP") {
          return Image(image: AssetImage('images/japan.png'));
      }
      else if (code == "zh-CN") {
          return Image(image: AssetImage('images/china.png'));
      }
      else if (code == "fr-FR") {
          return Image(image: AssetImage('images/france.png'));
      }
      else if (code == "de-DE") {
          return Image(image: AssetImage('images/germany.png'));
      }
      return Image(image: AssetImage('images/south-korea.png'));
  }
}
