import 'package:flutter/material.dart';

class MilkSellManagerView extends StatelessWidget {
  final int energyCount;
  final int milkLitters;
  final bool canSellMilk;
  final double selectedLitterPrice;
  final Function sellMilk;
  final Function onSelectedLitterPriceChanged;
  final double sellingFactor;
  final double milkPrice;

  static const int maxLitters = 1000;

  MilkSellManagerView(
      {@required this.energyCount,
      @required this.milkLitters,
      @required this.canSellMilk,
      @required this.selectedLitterPrice,
      @required this.sellMilk,
      @required this.onSelectedLitterPriceChanged,
      @required this.sellingFactor,
      @required this.milkPrice});

  @override
  Widget build(BuildContext context) {
    int sellingFactorDisplay = (sellingFactor * 100).toInt();
    double selectedLitterPriceDisplay =
        (selectedLitterPrice * 100).toInt() / 100.0;

    return new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                alignment: Alignment.centerLeft,
                child: new Text('Stock de lait',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              new Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Text(
                    'Votre lait peut être vendu à la population locale. Vous pouvez décider du prix de vente. Faites attention au prix imposé par la concurrence !',
                    style: new TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 12)),
              ),
              new Text("Prix du marché : $milkPrice€"),
              new Text("Votre prix : $selectedLitterPriceDisplay€"),
              new Text(
                  "Facteur de vente : maximum $sellingFactorDisplay% du stock"),
              new Container(
                  height: 40.0,
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Row(children: <Widget>[
                    new Image.asset(
                      'assets/images/milk_bottle_icon.png',
                      width: 48.0,
                      height: 48.0,
                      fit: BoxFit.contain,
                    ),
                    new Expanded(
                        child: new Stack(children: <Widget>[
                      new Container(
                          height: 40.0,
                          child: new LinearProgressIndicator(
                              value: milkLitters / maxLitters,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.teal))),
                      new Container(
                          height: 40.0,
                          child: new Align(
                              alignment: Alignment.center,
                              child: new Text(
                                '$milkLitters L/$maxLitters L',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )))
                    ]))
                  ])),
              new Visibility(
                  visible: canSellMilk && milkLitters > 0,
                  child: new RaisedButton(
                      elevation: 2,
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text('Vendre votre lait: -2'),
                          new Image.asset(
                            'assets/images/energy_icon.png',
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      onPressed: energyCount >= 2 ? () => sellMilk(context) : null)),
              new Visibility(
                  visible: !canSellMilk,
                  child: new Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new Text(
                          'Vous avez déjà vendu votre lait pour aujourd\'hui !'))),
              new Container(
                  height: 40.0,
                  child: new Row(children: <Widget>[
                    new Text("Prix de vente :"),
                    new Expanded(
                        child: new Slider(
                          min: 0.1,
                          divisions: 200,
                          label: "Prix : $selectedLitterPriceDisplay €/L",
                          max: 2,
                          value: selectedLitterPrice,
                          onChanged: onSelectedLitterPriceChanged))
                  ])),
            ]));
  }
}
