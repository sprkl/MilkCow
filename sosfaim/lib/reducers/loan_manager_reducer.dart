import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/actions/loan_manager_actions.dart';
import 'package:sosfaim/models/app_state.dart';

AppState loanManagerReducer(AppState state, action) {
  return combineReducers<AppState>([
    TypedReducer<AppState, IncrementDay>(_incrementDay),
    TypedReducer<AppState, RefundLoan>(_refundLoan)
  ])(state, action);
}

AppState _incrementDay(AppState state, IncrementDay action) {
  return state.copyWith(
    canSellMilk: true,
  );
}

AppState _refundLoan(AppState state, RefundLoan action) {
  var loans = state.loans.map((l) => l).toList();
  loans.removeWhere((l) => l.id == action.loan.id);
  return state.copyWith(loans: loans, capital: state.capital - action.loan.leftLoan);
}
