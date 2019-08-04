import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

import 'cow_manager_view.dart';
import 'cow_manager_viewmodel.dart';
import '../../modules/module.dart';

class CowManager extends StatelessWidget implements IModule {
  
  @override
  void execute() {
    // TODO: implement execute
  }

  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, CowManagerViewModel>(
        distinct: true,
        converter: (Store<AppState> store) {
          return CowManagerViewModel.from(store);
        },
        builder: (context, vm) {
          return CowManagerView(
            energyCount: vm.energyCount,
            capital: vm.capital,
            totalCowNumber: vm.totalCowNumber,
            selectedCowNumber: vm.selectedCowNumber, 
            onCowNumberValuedChanged: vm.onCowNumberValuedChanged,
            buyCow: vm.buyCow,
            sellCow: vm.sellCow,
            milkCows: vm.milkCows,
            canMilkCows: vm.canMilkCows,
          );
        });
  }
}