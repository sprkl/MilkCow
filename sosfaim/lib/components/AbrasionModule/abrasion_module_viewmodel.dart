import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/abrasion_module_actions.dart';
import 'package:sosfaim/models/app_state.dart';

class AbrasionModuleViewModel {

  final int energyCount;
  final int abrasion;
  final Function repairMaterial;

  factory AbrasionModuleViewModel.from(Store<AppState> store) {

    final repairMaterial = (repairCost) => store.dispatch(RepairMaterial(repairCost));

    return AbrasionModuleViewModel(
      energyCount: store.state.energyCount,
      abrasion: store.state.abrasion,
      repairMaterial: repairMaterial);
  }

  AbrasionModuleViewModel({
    @required this.energyCount,
    @required this.abrasion,
    @required this.repairMaterial});
}
