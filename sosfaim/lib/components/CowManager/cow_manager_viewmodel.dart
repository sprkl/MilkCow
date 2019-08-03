
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/cow_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';

class CowManagerViewModel {

  final int capital;
  final int totalCowNumber;
  final double selectedCowNumber;
  final Function onCowNumberValuedChanged;
  final Function buyCow;
  final Function sellCow;
  final Function milkCows;
  final bool canMilkCows;

  factory CowManagerViewModel.from(Store<AppState> store) {

    final onCowNumberValuedChanged = (selectedCowNumber) => store.dispatch(UpdateSelectedCowNumber(selectedCowNumber));
    final buyCow = (cowCount, price) => store.dispatch(BuyCow(cowCount, price));
    final sellCow = (cowCount, price) => store.dispatch(SellCow(cowCount, price));
    final milkCows = () => store.dispatch(MilkCows());

    return CowManagerViewModel(
      capital: store.state.capital,
      totalCowNumber: store.state.totalCowNumber,
      selectedCowNumber: store.state.selectedCowNumber,
      onCowNumberValuedChanged: onCowNumberValuedChanged,
      buyCow: buyCow,
      sellCow: sellCow,
      milkCows: milkCows, 
      canMilkCows: store.state.canMilkCows);
  }

  CowManagerViewModel({
    @required this.capital,
    @required this.totalCowNumber,
    @required this.selectedCowNumber,
    @required this.onCowNumberValuedChanged,
    @required this.buyCow,
    @required this.sellCow,
    @required this.milkCows,
    @required this.canMilkCows});
}
