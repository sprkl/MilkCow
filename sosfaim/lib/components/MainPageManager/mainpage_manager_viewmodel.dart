import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';

class MainPageManagerViewModel{

  final int dayCount;
  final Function onDayCountValueChanged;

  factory MainPageManagerViewModel.from(Store<AppState> store){

    final onDayCountValueChanged = () => store.dispatch(IncrementDay());

    return MainPageManagerViewModel(
      dayCount: store.state.dayCount,
      onDayCountValueChanged: onDayCountValueChanged);
  }

  MainPageManagerViewModel({
    @required this.dayCount,
    @required this.onDayCountValueChanged});
}