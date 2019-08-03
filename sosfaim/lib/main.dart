import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sosfaim/components/MainPageManager/mainpage_manager.dart';
import 'package:sosfaim/reducers/mainpage_module_reducer.dart';

<<<<<<< HEAD
=======
import 'components/AppHeader/app_header.dart';
import 'components/CowManager/cow_manager.dart';
import 'components/AbrasionModule/abrasion_module.dart';
>>>>>>> 5ea112332e500bf5483512aa2bc2346ec3e33392
import 'models/app_state.dart';
import 'reducers/cow_module_reducer.dart';
import 'reducers/app_state_reducer.dart';
import 'reducers/abrasion_module_reducer.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  final store = Store<AppState>(
<<<<<<< HEAD
      combineReducers<AppState>([appReducer, cowModuleReducer, abrasionModuleReducer]),
=======
      combineReducers<AppState>([appReducer, cowModuleReducer, mainpageModuleReducer]),
>>>>>>> a7db5dfb661ab30d50e7d89704f21587b327a644
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
<<<<<<< HEAD
  int dayCount = 1;
=======
>>>>>>> a7db5dfb661ab30d50e7d89704f21587b327a644

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new MainPageManager();
  }
}
