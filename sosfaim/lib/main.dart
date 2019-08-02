import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'components/AppHeader/app_header.dart';
import 'components/CowManager/cow_manager.dart';
import 'components/AbrasionModule/abrasion_module.dart';
import 'models/app_state.dart';
import 'reducers/cow_module_reducer.dart';
import 'reducers/app_state_reducer.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  final store = Store<AppState>(
      combineReducers<AppState>([appReducer, cowModuleReducer]),
      initialState: new AppState());

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
      body: new Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        new AppHeader(),
        new SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new CowManager(),
              new AbrasionModule()
            ],
          ),
        )
      ])
    );
  }
}
