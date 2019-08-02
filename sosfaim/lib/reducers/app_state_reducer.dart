

import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';


// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return combineReducers<AppState>([
    TypedReducer<AppState, IncrementDay>(_incrementDay),
    TypedReducer<AppState, AddCapital>(_addCapital)
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action){
  return state.copyWith(dayCount : state.dayCount+1);
}

double _updateMilkPrice(double milePrice, UpdateMilkPrice action) {
  return action.price;
}

AppState _addCapital(AppState state, AddCapital action){
  return state.copyWith(capital: state.capital+action.amount);
}