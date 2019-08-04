import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../models/app_state.dart';
import 'abrasion_module_view.dart';
import 'abrasion_module_viewmodel.dart';
import '../../modules/module.dart';

class AbrasionModule extends StatelessWidget implements IModule {
  
  @override
  void execute() {
    // TODO: implement execute
  }

  @override
  Widget build(BuildContext context) {

  return StoreConnector<AppState, AbrasionModuleViewModel> (
    distinct: true,
    converter: (Store<AppState> store) {
      return AbrasionModuleViewModel.from(store);
    },
    builder: (context, vm) {
      return AbrasionModuleView(
        energyCount: vm.energyCount,
        capital: vm.capital,
        abrasion: vm.abrasion,
        repairMaterial: vm.repairMaterial
      );
    });
  }
}