import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';
import 'package:sosfaim/models/loan.dart';

class LoanManagerViewModel {
  final List<Loan> loans;

  factory LoanManagerViewModel.from(Store<AppState> store) {
    return LoanManagerViewModel(loans: store.state.loans);
  }

  LoanManagerViewModel({@required this.loans});
}
