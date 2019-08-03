import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AbrasionModuleView extends StatelessWidget {
  final int abrasion;
  final Function repairMaterial;

  AbrasionModuleView({@required this.abrasion, @required this.repairMaterial});

  @override
  Widget build(BuildContext context) {
    var color = Colors.green;
    if (abrasion > 25) {
      color = Colors.orange;
    } else if (abrasion > 40) {
      color = Colors.red;
    }

    return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
              // A fixed-height child.
              height: 40.0,
              padding: const EdgeInsets.all(10.0),
              child: new LinearProgressIndicator(
                value: abrasion / 100.0,
                backgroundColor: color,
                valueColor: AlwaysStoppedAnimation<Color>(color.shade500),
              ))
        ]);
  }
}
