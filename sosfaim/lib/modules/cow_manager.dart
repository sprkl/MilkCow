import 'package:flutter/material.dart';
import 'package:sosfaim/actions/actions.dart';

import 'module.dart';

class CowManager extends StatelessWidget implements IModule {
  
 final int totalCowNumber = 0;

 final bool canShowCowButton = false;
 final double selectedCowNumber = 0;
 final String cowButtonText = '';

  @override
  void execute() {
    // TODO: implement execute
  }

  @override
  Widget build(BuildContext context) {

    final canShowCowButton = selectedCowNumber != 0; 

    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        new Container(
          // A fixed-height child.
          height: 40.0,
          padding: const EdgeInsets.all(10.0),
          child: new LinearProgressIndicator(
            value: totalCowNumber / 100.0,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          )
        ),
        new Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            new Text("Nombre de vaches :"),
            new Slider(
              min: -10,
              divisions: 20,
              max: 10,
              value: selectedCowNumber,
              onChanged: onCowNumberValuedChanged
            )
          ]
        ),
        new Visibility(
          visible: canShowCowButton,
          child: new RaisedButton(
            elevation: 2,
            child: Text(cowButtonText),
            onPressed: () {
              //Insert event to be fired up when button is clicked here
              //in this case, this increments our countValue variable by one.
              //setState(() => _progressValue += 0.1);
            }
          )
        )
      ]
    );
  }

  onCowNumberValuedChanged(value) {
    dispatch();
    // setState(() {
    //   selectedCowNumber = value;

    //   var selectedCowNumberInt = selectedCowNumber.toInt();
    //   cowButtonText = selectedCowNumber < 0 ? 'Vendre $selectedCowNumberInt vache(s)': 'Acheter $selectedCowNumberInt vache(s)';
    // });
  }
}