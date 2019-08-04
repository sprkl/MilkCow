import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

import 'energy_manager_view.dart';
import 'energy_manager_viewmodel.dart';
import '../../modules/module.dart';

class EnergyManager extends StatelessWidget implements IModule {
  
  @override
  void execute() {
    // TODO: implement execute
  }

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, EnergyManagerViewModel>(
      distinct: true,
      converter: (Store<AppState> store) {
        return EnergyManagerViewModel.from(store);
      },
      builder: (context, vm) {
        return EnergyManagerView(
          energyCount: vm.energyCount,
          previousEnergyCount: vm.previousEnergyCount,
        );
      }
    );
  }
}