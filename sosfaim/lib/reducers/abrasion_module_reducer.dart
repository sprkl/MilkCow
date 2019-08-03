// We create the State reducer by combining many smaller reducers into one!
import 'dart:math';

import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';

AppState abrasionModuleReducer(AppState state, action) {
  return combineReducers<AppState>([
    TypedReducer<AppState, IncrementDay>(_incrementDay)      
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action){
  var abrasion = state.abrasion + Random().nextInt(5);
  if(abrasion > 100)
    abrasion = 100;

  return state.copyWith(
    abrasion: abrasion
  );
}