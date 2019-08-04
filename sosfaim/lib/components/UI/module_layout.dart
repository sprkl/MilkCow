import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ModuleLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  ModuleLayout(
      {@required this.title, @required this.subtitle, @required this.child});

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Text(this.title,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(this.subtitle,
                style:
                    new TextStyle(fontStyle: FontStyle.italic, fontSize: 12)),
          ),
          this.child,
        ]));
  }
}
