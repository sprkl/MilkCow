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
  double _progressValue = 0.0;

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
        body: new ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int position) {
              return new Column(children: [
                new Container(
                  height: 30,
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(
                      child: new LinearProgressIndicator(
                        value: _progressValue,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                      ),
                    ),
                  ),
                ),
                new Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new RaisedButton(
                      child: Text('Click Button'),
                      onPressed: () {
                        //Insert event to be fired up when button is clicked here
                        //in this case, this increments our countValue variable by one.
                        setState(() => _progressValue += 0.1);
                      },
                    ),
                  ),
                )
              ]);
            }));
  }
}
