import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

import 'end_game_page_view.dart';
import 'end_game_page_viewmodel.dart';

class EndGamePage extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return StoreConnector<AppState, EndGamePageViewModel>(
      distinct: true,
      converter: (Store<AppState> store) {
        return EndGamePageViewModel.from(store);
      },
      builder: (context, vm) {
        return EndGamePageView(
        );
      });
  }
}