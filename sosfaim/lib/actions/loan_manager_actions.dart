import 'package:sosfaim/models/loan.dart';

class RefundLoan {
  final Loan loan;

  RefundLoan(this.loan);
}

class UpdateLoanAmount {
  final int amount;

  UpdateLoanAmount(this.amount);
}

class ContractLoan {
  final int amount;
  ContractLoan(this.amount);
}
