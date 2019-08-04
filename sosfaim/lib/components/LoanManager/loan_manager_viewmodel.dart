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
  final Function onLoanAmountChanged;
  final int selectedLoanAmount;
  final Function contractLoan;
  final bool loanContracted;
  final int energyCount;

  factory LoanManagerViewModel.from(Store<AppState> store) {
    Function refundLoan = (loan) => store.dispatch(RefundLoan(loan));
    Function loanAmountChanged =
        (double amount) => store.dispatch(UpdateLoanAmount(amount.toInt()));
    Function contractLoan =
        () => store.dispatch(ContractLoan(store.state.selectedLoanAmount));

    return LoanManagerViewModel(
        loans: store.state.loans,
        capital: store.state.capital,
        refundLoan: refundLoan,
        selectedLoanAmount: store.state.selectedLoanAmount,
        onLoanAmountChanged: loanAmountChanged,
        contractLoan: contractLoan,
        loanContracted : store.state.loanContracted,
        energyCount : store.state.energyCount);
  }

  LoanManagerViewModel(
      {@required this.loans,
      @required this.capital,
      @required this.refundLoan,
      @required this.onLoanAmountChanged,
      @required this.selectedLoanAmount,
      @required this.contractLoan,
      @required this.loanContracted,
      @required this.energyCount});
}
