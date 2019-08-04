import 'package:flutter/material.dart';

class Loan {
  final int leftLoan;
  final int weeklyInterests;
  final int refundWeeksLeft;

  const Loan(
      {@required this.leftLoan,
      @required this.weeklyInterests,
      @required this.refundWeeksLeft});
}
