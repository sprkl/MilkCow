

import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';

// AppState({
//     this.isLoading = false, 
//     this.modules = const [], 
//     this.dayCount = 1,
//     this.capital = 0,
//     this.milkPrice = 1,
//     this.milkProduction = 0});

// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: state.isLoading,
    modules : state.modules,
    dayCount: _incrementDay(state.dayCount, action),
    capital : state.capital,
    milkPrice: _updateMilkPrice(state.milkPrice, action),
    milkProduction: state.milkProduction
  );
}

int _incrementDay(int dayCount, IncrementDay action){
  return dayCount++;
}

double _updateMilkPrice(double milePrice, UpdateMilkPrice action) {
  return action.price;
}

_updateSelectedCowNumber(, UpdateSelectedCowNumber action)