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
    final selectedCowNumberInt = selectedCowNumber.toInt(); //todo absolute value
    final selectedCowCost = selectedCowNumberInt > 0 ? selectedCowNumberInt * 1500 : selectedCowNumberInt * 1000;
    final absSelectedCowNumberInt = selectedCowNumberInt.abs();
    final cowButtonText = selectedCowNumber < 0 ? 'Vendre $absSelectedCowNumberInt vache(s): $selectedCowCost €': 'Acheter $absSelectedCowNumberInt vache(s): $selectedCowCost €';
    
    return new Container(
      child: new Column(
        children: <Widget> [
          new Container(
            height: 40.0,
            padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
            child: new Row(
              children: <Widget> [
                new Image.asset(
                  'assets/images/cow_icon.png',
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
                          value: totalCowNumber / 100.0,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                        )
                      ),
                      new Container(
                        height: 40.0,
                        child: new Align(
                          alignment: Alignment.center,
                          child : new Text(
                            '$totalCowNumber/100',
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
          new Container(
            height: 40.0,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget> [
                new Text("Nombre de vaches :"),
                 new Expanded(
                  child: new Slider(
                    min: -10,
                    divisions: 20,
                    max: 10,
                    value: selectedCowNumber,
                    onChanged: onCowNumberValuedChanged
                  )
                )
              ]
            )
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
      )
    );
  }
}
