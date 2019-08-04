import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

class MainPageManagerViewModel{

  final int dayCount;

  factory MainPageManagerViewModel.from(Store<AppState> store){

    return MainPageManagerViewModel(
      dayCount: store.state.dayCount
    );
  }

  MainPageManagerViewModel({
    @required this.dayCount
  });
}