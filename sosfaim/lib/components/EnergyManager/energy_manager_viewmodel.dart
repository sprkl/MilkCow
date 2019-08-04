
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

class EnergyManagerViewModel {

  final int energyCount;

  factory EnergyManagerViewModel.from(Store<AppState> store) {

    return EnergyManagerViewModel(
      energyCount: store.state.energyCount);
  }

  EnergyManagerViewModel({
    @required this.energyCount});
}
