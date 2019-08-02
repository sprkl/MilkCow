import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'models/app_state.dart';
import 'reducers/app_state_reducer.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  final store = Store<AppState>(appReducer, initialState: new AppState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: new MaterialApp(
          title: 'Sample App',
          theme: new ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: new SampleAppPage(),
        ));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);
  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
 List widgets = [];
 int dayCount = 1;

 int totalCowNumber = 0;

 bool canShowCowButton = false;
 double selectedCowNumber = 0;
 var cowButtonText = '';

 @override
 void initState() {
   super.initState();
 }
 
 @override
 Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Jour $dayCount"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Column(
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
            ),
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
          ],
        ),
      )
    );
  }

  onCowNumberValuedChanged(value) {
    setState(() {
      selectedCowNumber = value;
      canShowCowButton = value != 0;

      var selectedCowNumberInt = selectedCowNumber.toInt();
      cowButtonText = selectedCowNumber < 0 ? 'Vendre $selectedCowNumberInt vache(s)': 'Acheter $selectedCowNumberInt vache(s)';
    });
  }
}
