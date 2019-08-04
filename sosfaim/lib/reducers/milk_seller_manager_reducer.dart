import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';

AppState milkSellerManagerReducer(AppState state, action) {
  return combineReducers<AppState>(
      [TypedReducer<AppState, IncrementDay>(_incrementDay)])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action) {
  return state.copyWith(
    canSellMilk: true,
  );
}
