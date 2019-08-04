import 'package:flutter/material.dart';
import 'package:sosfaim/components/UI/module_layout.dart';
import 'package:sosfaim/models/loan.dart';

class LoanManagerView extends StatelessWidget {
  final List<Loan> loans;

  LoanManagerView({
    @required this.loans,
  });

  @override
  Widget build(BuildContext context) {
    return new ModuleLayout(
      title: "Capital / Prêt",
      subtitle:
          "Gérez intelligement votre business pour investir dans la production de lait et augmenter votre capital. Si vous manquez d'argent, vous pouvez faire un prêt !",
      child : new Column(
        children: [
          new Text("hello")
        ],
      )
    );
  }
}
