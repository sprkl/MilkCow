import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

class EndGamePageViewModel {
  factory EndGamePageViewModel.from(Store<AppState> store) {
    return EndGamePageViewModel();
  }

  EndGamePageViewModel();
}
