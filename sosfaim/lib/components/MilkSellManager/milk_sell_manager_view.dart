import 'package:flutter/material.dart';

class MilkSellManagerView extends StatelessWidget{

  final int milkLitters;
  final bool canSellMilk;
  final double selectedLitterPrice;
  final Function sellMilk;
  final Function onSelectedLitterPriceChanged;

  static const int maxLitters = 1000;

  MilkSellManagerView({
    @required this.milkLitters,
    @required this.canSellMilk,
    @required this.selectedLitterPrice,
    @required this.sellMilk,
    @required this.onSelectedLitterPriceChanged
  });

  @override 
  Widget build(BuildContext context){
    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget> [
          new Container(
            alignment: Alignment.centerLeft,
            child: new Text(
              'Stock de lait',
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
              'Votre lait peut être vendu à la population locale. Vous pouvez décider du prix de vente. Faites attention au prix imposé par la concurrence !',
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
                  'assets/images/milk_bottle_icon.png',
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
                          value: milkLitters / maxLitters,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)
                        )
                      ),
                      new Container(
                        height: 40.0,
                        child: new Align(
                          alignment: Alignment.center,
                          child: new Text(
                            '$milkLitters/$maxLitters',
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
            visible: canSellMilk,
            child: new RaisedButton(
              elevation: 2,
              child: Text('Vendre: todo'),
              onPressed: sellMilk
            )
          ),
           new Visibility(
            visible: !canSellMilk,
            child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
              'Vous avez déjà vendu votre lait pour aujourd\'hui !'
              )
            )
          ),
          new Container(
            height: 40.0,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget> [
                new Text("Prix de vente :"),
                  new Expanded(
                    child: new Slider(
                      min: 0.01,
                      divisions: 500,
                      max: 5,
                      value: selectedLitterPrice,
                      onChanged: onSelectedLitterPriceChanged
                  )
                )
              ]
            )
          ),
        ]
      )
    );
  }
}