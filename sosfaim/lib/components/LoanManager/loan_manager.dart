import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

import 'loan_manager_view.dart';
import 'loan_manager_viewmodel.dart';

class LoanManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoanManagerViewModel>(
        distinct: true,
        converter: (Store<AppState> store) {
          return LoanManagerViewModel.from(store);
        },
        builder: (context, vm) {
          return LoanManagerView(loans: vm.loans);
        });
  }
}
