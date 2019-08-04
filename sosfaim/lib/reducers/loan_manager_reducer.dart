import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/actions/loan_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';
import 'package:sosfaim/models/loan.dart';

AppState loanManagerReducer(AppState state, action) {
  return combineReducers<AppState>([
    TypedReducer<AppState, IncrementDay>(_incrementDay),
    TypedReducer<AppState, RefundLoan>(_refundLoan),
    TypedReducer<AppState, UpdateLoanAmount>(_updateLoanAmount),
    TypedReducer<AppState, ContractLoan>(_contractLoan)
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action) {
  bool shouldPayInterest = state.dayCount % 7 == 0;

  int totalInterests = 0;
  if (shouldPayInterest && state.loans.isNotEmpty) {
    totalInterests = state.loans
        .map((l) => l.leftLoan / 100.0 * l.weeklyInterests)
        .toList()
        .reduce(((v, l) => v + l))
        .toInt();
  }

  return state.copyWith(
      capital: state.capital - totalInterests, loanContracted: false);
}

AppState _refundLoan(AppState state, RefundLoan action) {
  var loans = state.loans.map((l) => l).toList();
  loans.removeWhere((l) => l.id == action.loan.id);
  return state.copyWith(
      loans: loans,
      energyCount: state.energyCount - 1,
      previousEnergyCount : state.energyCount,
      capital: state.capital - action.loan.leftLoan);
}

AppState _updateLoanAmount(AppState state, UpdateLoanAmount action) {
  return state.copyWith(selectedLoanAmount: action.amount);
}

AppState _contractLoan(AppState state, ContractLoan action) {
  int newLoanId = state.lastLoanId + 1;
  var loans = state.loans.map((l) => l).toList();
  loans.add(new Loan(
      id: newLoanId,
      initialWeeksCount: 30,
      refundWeeksLeft: 30,
      weeklyInterests: 2,
      leftLoan: action.amount));

  return state.copyWith(
      capital: state.capital + action.amount,
      loanContracted: true,
      loans: loans,
      lastLoandId: newLoanId);
}
