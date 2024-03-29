import 'dart:math';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/abrasion_module_actions.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/actions/cow_manager_actions.dart';
import 'package:sosfaim/actions/sell_milk_manager_actions.dart';
import 'package:sosfaim/components/EndGamePage/end_game_page.dart';
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
    TypedReducer<AppState, UpdateSelectedLitterPrice>(
        _updateSelectedLitterPrice),
    TypedReducer<AppState, SellMilk>(_sellMilk)
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action) {
  var day = state.dayCount + 1;

  if (day >= 15 && action.context != null) {
    Navigator.push(
        action.context, MaterialPageRoute(builder: (context) => EndGamePage()));
  }

  var newMilkPrice = 0.0;
  if (state.dayCount == 4) {
    newMilkPrice = 0.60;

    final snackBar = SnackBar(
      backgroundColor: Theme.of(action.context).colorScheme.primary,
      content: Text(
          'La surproduction de lait en Europe entraîne une chute importante du prix de vente.'),
      duration: new Duration(seconds: 4),
    );
    Scaffold.of(action.context).showSnackBar(snackBar);
  } else if (state.dayCount == 9) {
    newMilkPrice = 0.20;

    final snackBar = SnackBar(
      backgroundColor: Theme.of(action.context).colorScheme.primary,
      content: Text(
          'Suite au vote d\'une loi européene, le prix du lait est fixé à 0.20 €/L.'),
      duration: new Duration(seconds: 4),
    );
    Scaffold.of(action.context).showSnackBar(snackBar);
  }

  var milkPrice = newMilkPrice > 0 ? newMilkPrice : state.milkPrice;

  return state.copyWith(
      dayCount: day,
      energyCount: min(state.energyCount + 3, 5),
      previousEnergyCount: state.energyCount,
      canMilkCows: true,
      canSellMilk: true,
      milkPrice: milkPrice,
      abrasion: state.abrasion);
}

AppState _updateMilkPrice(AppState state, UpdateMilkPrice action) {
  return state.copyWith(milkPrice: action.price);
}

AppState _updateSelectedCowNumber(
    AppState state, UpdateSelectedCowNumber action) {
  return state.copyWith(selectedCowNumber: action.selectedCowNumber);
}

AppState _addCapital(AppState state, AddCapital action) {
  return state.copyWith(capital: state.capital + action.amount);
}

AppState _repairMaterial(AppState state, RepairMaterial action) {
  return state.copyWith(
      capital: state.capital - action.repairCost,
      abrasion: 0,
      energyCount: state.energyCount - 3,
      previousEnergyCount: state.energyCount);
}

AppState _buyCow(AppState state, BuyCow action) {
  return state.copyWith(
      totalCowNumber: state.totalCowNumber + action.cowCount,
      capital: state.capital + action.totalCost, // action.totalCost is negative
      selectedCowNumber: 0);
}

AppState _sellCow(AppState state, SellCow action) {
  return state.copyWith(
      totalCowNumber: state.totalCowNumber - action.cowCount,
      capital: state.capital + action.totalCost,
      selectedCowNumber: 0);
}

AppState _milkCows(AppState state, MilkCows action) {
  var milkGain =
      (state.totalCowNumber * (30 * ((100 - state.abrasion) / 100.0))).toInt();
  var milkLitters = state.milkLitters + milkGain;
  if (milkLitters > 1000) {
    milkLitters = 1000;

    final snackBar = SnackBar(
      backgroundColor: Theme.of(action.context).colorScheme.primary,
      content: Text('Votre stock de lait est plein. Pensez à le vendre !'),
      duration: new Duration(seconds: 4),
    );
    Scaffold.of(action.context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(
      backgroundColor: Theme.of(action.context).colorScheme.primary,
      content: Text('Vous avez récolté $milkGain litres !'),
      duration: new Duration(seconds: 4),
    );
    Scaffold.of(action.context).showSnackBar(snackBar);
  }

  return state.copyWith(
      milkLitters: milkLitters.toInt(),
      canMilkCows: false,
      energyCount: state.energyCount - 2,
      previousEnergyCount: state.energyCount);
}

AppState _updateSelectedLitterPrice(
    AppState state, UpdateSelectedLitterPrice action) {
  return state.copyWith(
      sellingFactor:
          min(pow(state.milkPrice / state.selectedLitterPrice, 2), 1.0),
      selectedLitterPrice:
          (action.selectedLitterPrice * 100.0).toInt() / 100.0);
}

AppState _sellMilk(AppState state, SellMilk action) {
  if (state.milkLitters == null || state.milkLitters == 0) {
    return state;
  }

  var soldMilkLitters =
      Random().nextInt((state.milkLitters * state.sellingFactor).toInt());
  int amount = (state.selectedLitterPrice * soldMilkLitters).toInt();

  var capital = state.capital + amount;

  final snackBar = SnackBar(
    backgroundColor: Theme.of(action.context).colorScheme.primary,
    content: Text(
        'Vous avez vendu $soldMilkLitters litres pour un montant de $amount€ !'),
    duration: new Duration(seconds: 4),
  );
  Scaffold.of(action.context).showSnackBar(snackBar);

  return state.copyWith(
      capital: capital.toInt(),
      milkLitters: state.milkLitters - soldMilkLitters,
      canSellMilk: false,
      energyCount: state.energyCount - 2,
      previousEnergyCount: state.energyCount);
}
