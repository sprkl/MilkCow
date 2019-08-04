import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/actions/loan_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';
import 'package:sosfaim/models/loan.dart';

class LoanManagerViewModel {
  final List<Loan> loans;
  final int capital;
  final Function refundLoan;

  factory LoanManagerViewModel.from(Store<AppState> store) {

    Function refundLoan = (loan) => store.dispatch(RefundLoan(loan));

    return LoanManagerViewModel(
        loans: store.state.loans, 
        capital: store.state.capital,
        refundLoan: refundLoan);
  }

  LoanManagerViewModel(
      {@required this.loans,
      @required this.capital,
      @required this.refundLoan});
}
