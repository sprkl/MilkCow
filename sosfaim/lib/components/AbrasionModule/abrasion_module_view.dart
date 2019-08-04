import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AbrasionModuleView extends StatelessWidget {

  final int energyCount;
  final int abrasion;
  final Function repairMaterial;

  AbrasionModuleView({
    @required this.energyCount,
    @required this.abrasion, 
    @required this.repairMaterial
  });

  @override
  Widget build(BuildContext context) {

    var color = getAbrasionColor();
    var canShowRepairButton = abrasion > 0;
    var repairCost = abrasion * 30;
    var repairButtonText = 'Réparer: -$repairCost €';

    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              'Usure du matériel',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text(
              'L\'état du matériel influence votre production de lait. Plus votre matériel est usé, moins vous aurez du lait de votre bétail.',
              style: new TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12
              )
            ),
          ),
          new Text('Influence : -$abrasion% de lait récolté par traite'),
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
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                        )
                      ),
                      new Container(
                        height: 40.0,
                        child: new Align(
                          alignment: Alignment.center,
                          child: new Text(
                            '$abrasion/100',
                            style: new TextStyle(
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
              child: new Row (
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text(repairButtonText + ' / -3'),
                  new Image.asset(
                    'assets/images/energy_icon.png',
                    width: 20.0,
                    height: 20.0,
                    fit: BoxFit.contain,
                  ),
                ], 
              ),
              onPressed: energyCount >= 3 ? () => repairMaterial(repairCost) : null
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
