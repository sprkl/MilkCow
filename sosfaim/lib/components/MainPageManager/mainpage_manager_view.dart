import 'package:flutter/material.dart';
import '../AppHeader/app_header.dart';
import '../CowManager/cow_manager.dart';

class MainPageManagerView extends StatelessWidget{

  final int dayCount;
  final Function onDayCountValueChanged;

  MainPageManagerView({
    @required this.dayCount,
    @required this.onDayCountValueChanged
  });

  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Jour $dayCount"),
      ),
      body: new Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        new AppHeader(),
        new SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new CowManager()
            ],
          ),
        ),
        new Container(
          height: 50,
          child: new FlatButton(
              color: Colors.teal,
              child: new Text("Passer au jour suivant"),
              onPressed: () => onDayCountValueChanged(),
            )
        )
      ])
    );
  }
}