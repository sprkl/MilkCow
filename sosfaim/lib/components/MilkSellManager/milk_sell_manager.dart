import 'package:flutter/material.dart';
import 'package:sosfaim/components/MilkSellManager/milk_sell_manager_viewmodel.dart';
import 'package:sosfaim/components/MilkSellManager/milk_sell_manager_view.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

class MilkSellManager extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return StoreConnector<AppState, MilkSellManagerViewModel>(
      distinct: true,
      converter: (Store<AppState> store) {
        return MilkSellManagerViewModel.from(store);
      },
      builder: (context, vm) {
        return MilkSellManagerView(
          energyCount: vm.energyCount,
          canSellMilk: vm.canSellMilk,
          milkLitters: vm.milkLitters,
          selectedLitterPrice: vm.selectedLitterPrice,
          sellMilk: vm.sellMilk,
          onSelectedLitterPriceChanged: vm.onSelectedLitterPriceChanged
        );
      });
  }
}