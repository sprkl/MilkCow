import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AbrasionModuleView extends StatelessWidget {
  final int abrasion;
  final Function repairMaterial;

  AbrasionModuleView({@required this.abrasion, @required this.repairMaterial});

  @override
  Widget build(BuildContext context) {

    var color = getAbrasionColor();
    var canShowRepairButton = abrasion > 0;
    var repairCost = abrasion * - 30;
    var repairButtonText = 'Réparer: $repairCost €';

    return new Container(
      child: new Column(
        children: <Widget> [
          new Container(
            height: 40.0,
            padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
            child: new Row(
              children: <Widget> [
                new Image.asset(
                  'assets/images/gears_icon.png',
                  width: 48.0,
                  height: 48.0,
                  fit: BoxFit.contain,
                ),
                new Expanded(
                  child: new Stack(
                    children: <Widget> [
                      new Container(
                        height: 40.0,
                        child: new LinearProgressIndicator(
                          value: abrasion / 100.0,
                          backgroundColor: color,
                          valueColor: AlwaysStoppedAnimation<Color>(color.shade500),
                        )
                      ),
                      new Container(
                        height: 40.0,
                        child: new Align(
                          alignment: Alignment.center,
                          child : new Text(
                            '$abrasion/100',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )
                        )
                      )
                    ]
                  )
                )
              ]
            )
          ),
          new Visibility(
            visible: canShowRepairButton,
            child: new RaisedButton(
              elevation: 2,
              child: Text(repairButtonText),
              onPressed: repairMaterial
            )
          )
        ]
      )
    );
  }

  getAbrasionColor()  {
    if (abrasion >= 66) {
      return Colors.red;
    }
    else if (abrasion >= 33) {
      return Colors.orange;
    }
    else {
      return Colors.teal;
    }
  }
}
