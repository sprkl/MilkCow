
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:sosfaim/actions/actions.dart';
import 'package:sosfaim/models/app_state.dart';

class AppHeaderViewModel {
  final int capital;
  final Function onClick;
  final Function onDayCountValueChanged;

  factory AppHeaderViewModel.from(Store<AppState> store) {

    final onClick = () => store.dispatch(AddCapital(5));
    final onDayCountValueChanged = (context) => store.dispatch(IncrementDay(context));

    return AppHeaderViewModel(
      capital: store.state.capital,
      onClick: onClick,
      onDayCountValueChanged: onDayCountValueChanged);
  }

  AppHeaderViewModel({
    @required this.capital,
    @required this.onClick,
    @required this.onDayCountValueChanged
  });
}
