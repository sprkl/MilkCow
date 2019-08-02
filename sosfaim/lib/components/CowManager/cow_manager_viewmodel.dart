
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/cow_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';

class CowManagerViewModel {

  final int totalCowNumber;
  final double selectedCowNumber;
  final Function onCowNumberValuedChanged;

  factory CowManagerViewModel.from(Store<AppState> store) {

    final onCowNumberValuedChanged = (selectedCowNumber) => store.dispatch(UpdateSelectedCowNumber(selectedCowNumber));

    return CowManagerViewModel(
        totalCowNumber: store.state.totalCowNumber,
        selectedCowNumber: store.state.selectedCowNumber,
        onCowNumberValuedChanged: onCowNumberValuedChanged);
  }

  CowManagerViewModel(
      {@required this.totalCowNumber,
      @required this.selectedCowNumber,
      @required this.onCowNumberValuedChanged});
}
