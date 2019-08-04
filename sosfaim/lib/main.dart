import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sosfaim/components/MainPageManager/mainpage_manager.dart';
import 'package:sosfaim/reducers/mainpage_module_reducer.dart';

import 'models/app_state.dart';
import 'reducers/cow_module_reducer.dart';
import 'reducers/app_state_reducer.dart';
import 'reducers/abrasion_module_reducer.dart';
import 'reducers/loan_manager_reducer.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  final store = Store<AppState>(
      combineReducers<AppState>([
        appReducer,
        cowModuleReducer,
        abrasionModuleReducer,
        mainpageModuleReducer,
        loanManagerReducer
      ]),
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MainPageManager();
  }
}
