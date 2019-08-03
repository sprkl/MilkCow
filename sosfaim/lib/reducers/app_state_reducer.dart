import 'dart:math';

import 'package:redux/redux.dart';
import 'package:sosfaim/actions/abrasion_module_actions.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/actions/cow_manager_actions.dart';
import 'package:sosfaim/actions/sell_milk_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';

// We create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return combineReducers<AppState>([
    TypedReducer<AppState, IncrementDay>(_incrementDay),
    TypedReducer<AppState, AddCapital>(_addCapital),
    TypedReducer<AppState, UpdateMilkPrice>(_updateMilkPrice),
    TypedReducer<AppState, UpdateSelectedCowNumber>(_updateSelectedCowNumber),
    TypedReducer<AppState, RepairMaterial>(_repairMaterial),
    TypedReducer<AppState, BuyCow>(_buyCow),
    TypedReducer<AppState, SellCow>(_sellCow),
    TypedReducer<AppState, MilkCows>(_milkCows),
    TypedReducer<AppState, UpdateSelectedLitterPrice>(_updateSelectedLitterPrice),
    TypedReducer<AppState, SellMilk>(_sellMilk)
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action){

  var abrasion = state.abrasion + Random().nextInt(5);
  if(abrasion > 100)
    abrasion = 100;

  return state.copyWith(
    dayCount : state.dayCount + 1,
    canMilkCows: true,
    canSellMilk: true,
    abrasion: abrasion
  );
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

AppState _repairMaterial(AppState state, RepairMaterial action) {
  return state.copyWith(
    capital: state.capital - action.repairCost,
    abrasion: 0);
}

AppState _buyCow(AppState state, BuyCow action) {
  return state.copyWith(
    totalCowNumber: state.totalCowNumber + action.cowCount,
    capital: state.capital + action.totalCost, // action.totalCost is negative
    selectedCowNumber: 0
  );
}

AppState _sellCow(AppState state, SellCow action) {
  return state.copyWith(
    totalCowNumber: state.totalCowNumber - action.cowCount,
    capital: state.capital + action.totalCost,
    selectedCowNumber: 0
  );
}

AppState _milkCows(AppState state, MilkCows action) {
  var milkLitters = state.milkLitters + state.totalCowNumber * (30 * state.abrasion * 0.01);

  return state.copyWith(
    milkLitters: milkLitters.toInt(),
    canMilkCows: false
  );
}

AppState _updateSelectedLitterPrice(AppState state, UpdateSelectedLitterPrice action) {
  return state.copyWith(
    selectedLitterPrice: action.selectedLitterPrice
  );
}

AppState _sellMilk(AppState state, SellMilk action) {

  var soldMilkLitters = Random().nextInt(state.milkLitters);
  var capital = state.capital + state.selectedLitterPrice * soldMilkLitters;

  return state.copyWith(
    capital: capital.toInt(),
    milkLitters: state.milkLitters - soldMilkLitters,
    canSellMilk: false
  );
}