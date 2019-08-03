import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CowManagerView extends StatelessWidget {
  
  final int capital;
  final int totalCowNumber;
  final double selectedCowNumber;
  final Function onCowNumberValuedChanged;
  final Function buyCow;
  final Function sellCow;

  final int cowSellPrice = 1000;
  final int cowBuyPrice = 1500;
  final int maxCowCount = 100;

  CowManagerView({
    @required this.capital,
    @required this.totalCowNumber,
    @required this.selectedCowNumber, 
    @required this.onCowNumberValuedChanged, 
    @required this.buyCow,
    @required this.sellCow});

  @override
  Widget build(BuildContext context) {

    final canShowCowButton = selectedCowNumber != 0; 
    final selectedCowNumberInt = selectedCowNumber.toInt(); //todo absolute value
    final selectedCowCost = selectedCowNumberInt > 0 ? selectedCowNumberInt * -cowBuyPrice : selectedCowNumberInt * -cowSellPrice;
    final absSelectedCowNumberInt = selectedCowNumberInt.abs();
    final cowButtonText = selectedCowNumber < 0 ? 'Vendre $absSelectedCowNumberInt vache(s): $selectedCowCost €': 'Acheter $absSelectedCowNumberInt vache(s): $selectedCowCost €';
    double maxBuyableCowCount = getClampedMaxBuyableCount();
    
    return new Container(
      child: new Column(
        children: <Widget> [
          new Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new Text(
              'Bétail',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              'Les vaches produisent du lait. Vous pouvez les traire chaque jour pour augmenter votre stock de lait.',
              style: new TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12
              )
            ),
          ),
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
                          child: new Text(
                            '$totalCowNumber/100',
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
          new Container(
            height: 40.0,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget> [
                new Text("Achat / vente :"),
                 new Expanded(
                  child: new Slider(
                    min: totalCowNumber == 0 ? 0.0 : -totalCowNumber.toDouble(),
                    divisions: totalCowNumber + maxBuyableCowCount.toInt(),
                    max: maxBuyableCowCount,
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
                if(selectedCowNumberInt > 0)
                  buyCow(absSelectedCowNumberInt, selectedCowCost);
                else if(selectedCowNumberInt < 0)
                  sellCow(absSelectedCowNumberInt, selectedCowCost);
              }
            )
          )
        ]
      )
    );
  }

  getClampedMaxBuyableCount() {
    var maxBuyableCowCount = (capital / cowBuyPrice).toInt().toDouble();

    if(maxBuyableCowCount < 0 || maxBuyableCowCount < 1)
      maxBuyableCowCount = 0;
    else if(maxBuyableCowCount > (maxCowCount - selectedCowNumber)) 
      maxBuyableCowCount = maxCowCount - selectedCowNumber;

    return maxBuyableCowCount;
  }
}
