import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sosfaim/components/UI/animated_progress_indicator.dart';

class EnergyManagerView extends StatelessWidget {
  
  final int energyCount;
  final int previousEnergyCount;

  EnergyManagerView({
    @required this.energyCount, @required this.previousEnergyCount});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: new Column(
        children: <Widget> [
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              'Énergie',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10.0),
            child: new Text(
              'Vous possédez une quantité limitée d\'énergie par jour. Vous pouvez l\'utiliser pour effectuer certaines actions.',
              style: new TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12
              )
            ),
          ),
          new Container(
            height: 40.0,
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Row(
              children: <Widget> [
                new Image.asset(
                  'assets/images/energy_icon.png',
                  width: 48.0,
                  height: 48.0,
                  fit: BoxFit.contain,
                ),
                new Expanded(
                  child: new Stack(
                    children: <Widget> [
                      new Container(
                        height: 40.0,
                        child:  new AnimatedProgressIndicator(
                          from : previousEnergyCount.toDouble() * 0.2,
                          to: energyCount.toDouble() * 0.2,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                        )
                      ),
                      new Container(
                        height: 40.0,
                        child: new Align(
                          alignment: Alignment.center,
                          child: new Text(
                            '$energyCount/5',
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
          )
        ]
      )
    );
  }
}
