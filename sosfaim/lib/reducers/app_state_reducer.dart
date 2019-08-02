import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/actions/cow_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';


// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return combineReducers<AppState>([
    TypedReducer<AppState, IncrementDay>(_incrementDay),
    TypedReducer<AppState, AddCapital>(_addCapital),
    TypedReducer<AppState, UpdateMilkPrice>(_updateMilkPrice),
    TypedReducer<AppState, UpdateSelectedCowNumber>(_updateSelectedCowNumber)
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action){
  return state.copyWith(dayCount : state.dayCount+1);
}

AppState _updateMilkPrice(AppState state, UpdateMilkPrice action) {
  return state.copyWith(milkPrice : action.price);
}

AppState _updateSelectedCowNumber(AppState state, UpdateSelectedCowNumber action) {
  return state.copyWith(selectedCowNumber : action.selectedCowNumber);
}

AppState _addCapital(AppState state, AddCapital action){
  return state.copyWith(capital: state.capital+action.amount);
}
