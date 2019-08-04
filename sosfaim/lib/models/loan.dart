import 'package:flutter/material.dart';

class Loan {
  final int id;
  final int leftLoan;
  final int weeklyInterests;
  final int refundWeeksLeft;
  final int initialWeeksCount;

  const Loan(
      {@required this.leftLoan,
      @required this.weeklyInterests,
      @required this.refundWeeksLeft,
      @required this.initialWeeksCount,
      @required this.id});
}
