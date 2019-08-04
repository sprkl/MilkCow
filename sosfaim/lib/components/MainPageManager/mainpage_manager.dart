import 'package:flutter/material.dart';
import 'package:sosfaim/components/MainPageManager/mainpage_manager_viewmodel.dart';
import 'package:sosfaim/components/MainPageManager/mainpage_manager_view.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

class MainPageManager extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return StoreConnector<AppState, MainPageManagerViewModel>(
      distinct: true,
      converter: (Store<AppState> store) {
        return MainPageManagerViewModel.from(store);
      },
      builder: (context, vm) {
        return MainPageManagerView(
          dayCount: vm.dayCount,
        );
      });
  }
}