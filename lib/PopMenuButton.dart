import 'package:flutter/material.dart';

import 'icons/g_icons_icons.dart';

typedef PopMenuButtonCallback = void Function(int index);

class PopMenuButton extends StatelessWidget {
  PopMenuButton({Key key, this.onMenuPressed, this.menus}) : super(key: key);

  final PopMenuButtonCallback onMenuPressed;
  final List<String> menus;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
          minHeight: 0, minWidth: 0),
      materialTapTargetSize:
      MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.fromLTRB(16, 8, 0, 20),
      onPressed: () {
        print("menu clicked");
        if (onMenuPressed != null) {
            onMenuPressed(1);
        }
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
                  color: Colors.black38,
                  size: 10,
                )),
            Container(
//                                        color: Colors.red,
                child: Icon(
                  GIcons.primitive_dot,
                  color: Colors.black38,
                  size: 10,
                )),
            Container(
                child: Icon(
                  GIcons.primitive_dot,
                  color: Colors.black38,
                  size: 10,
                )),
          ],
        ),
      ),
    );
  }
}


