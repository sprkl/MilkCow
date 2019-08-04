// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sosfaim/components/EnergyManager/energy_manager.dart';

class AppHeaderView extends StatelessWidget {
  final int capital;
  final Function onClick;
  final Function onDayCountValueChanged;

  AppHeaderView({ 
    @required this.capital,
    @required this.onClick,
    @required this.onDayCountValueChanged
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(bottom: 20.0),
      color: Theme.of(context).backgroundColor.withAlpha(150),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new EnergyManager(),
          new Padding(
            padding : EdgeInsets.only(left: 20.0, right:20),
            child: new RaisedButton(
              elevation: 2,
              child: new Text("Passer au jour suivant"),
              onPressed: () => onDayCountValueChanged(context),
            )
          )
        ],
      )
    );
  }
}
