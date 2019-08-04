// We create the State reducer by combining many smaller reducers into one!
import 'dart:math';

import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';

AppState cowModuleReducer(AppState state, action) {
  return combineReducers<AppState>(
      [TypedReducer<AppState, IncrementDay>(_incrementDay)])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action) {
  return state.copyWith(canMilkCows: true, selectedCowNumber: 0);
}
