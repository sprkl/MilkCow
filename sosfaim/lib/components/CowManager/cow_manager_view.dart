// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CowManagerView extends StatelessWidget {
  
  final int totalCowNumber;
  final double selectedCowNumber;
  final Function onCowNumberValuedChanged;

  CowManagerView(
      {@required this.totalCowNumber,
      @required this.selectedCowNumber, 
      @required this.onCowNumberValuedChanged});

  @override
  Widget build(BuildContext context) {

    final canShowCowButton = selectedCowNumber != 0; 
    final selectedCowNumberInt = selectedCowNumber.toInt();
    final cowButtonText = selectedCowNumber < 0 ? 'Vendre $selectedCowNumberInt vache(s)': 'Acheter $selectedCowNumberInt vache(s)';
    
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
}
