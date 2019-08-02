// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppHeaderView extends StatelessWidget {
  final int capital;
  final double milkPrice;
  final int milkProduction;
  final Function onClick;

  AppHeaderView(
      {@required this.capital,
      @required this.milkPrice,
      @required this.milkProduction,
      @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10),
      color: Theme.of(context).backgroundColor.withAlpha(150),
      height: 200.0,
      child:
          new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        new Column(children: <Widget>[
          new Icon(Icons.attach_money),
          new Text(this.capital.toString())
        ]),
        new Column(children: <Widget>[
          new Icon(Icons.local_drink),
          new Text(this.milkPrice.toString())
        ]),
        new Column(children: <Widget>[
          new Icon(Icons.multiline_chart),
          new Text(this.milkProduction.toString())
        ])
      ]),
    );
  }
}
