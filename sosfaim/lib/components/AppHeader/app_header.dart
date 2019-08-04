import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

import 'app_header_view.dart';
import 'app_header_viewmodel.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppHeaderViewModel>(
        distinct: true,
        converter: (Store<AppState> store) {
          return AppHeaderViewModel.from(store);
        },
        builder: (context, vm) {
          return AppHeaderView(
            capital: vm.capital,
            onClick: vm.onClick,
            onDayCountValueChanged: vm.onDayCountValueChanged
          );
        });
  }
}
