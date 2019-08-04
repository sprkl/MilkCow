import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/sell_milk_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';

class MilkSellManagerViewModel{

  final int energyCount;
  final int milkLitters;
  final bool canSellMilk;
  final double selectedLitterPrice;
  final Function sellMilk;
  final Function onSelectedLitterPriceChanged;

  factory MilkSellManagerViewModel.from(Store<AppState> store){

    final sellMilk = () => store.dispatch(SellMilk());
    final onSelectedLitterPriceChanged = (selectedLitterPrice) => store.dispatch(UpdateSelectedLitterPrice(selectedLitterPrice));

    return MilkSellManagerViewModel(
      energyCount: store.state.energyCount,
      milkLitters: store.state.milkLitters,
      canSellMilk: store.state.canSellMilk,
      selectedLitterPrice: store.state.selectedLitterPrice,
      sellMilk: sellMilk, 
      onSelectedLitterPriceChanged: onSelectedLitterPriceChanged);
  }

  MilkSellManagerViewModel({
    @required this.energyCount,
    @required this.milkLitters,
    @required this.canSellMilk,
    @required this.selectedLitterPrice,
    @required this.sellMilk,
    @required this.onSelectedLitterPriceChanged
  });
}