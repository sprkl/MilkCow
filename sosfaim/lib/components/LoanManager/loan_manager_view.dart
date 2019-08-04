import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sosfaim/components/UI/loan_item.dart';
import 'package:sosfaim/components/UI/module_layout.dart';
import 'package:sosfaim/models/loan.dart';

class LoanManagerView extends StatelessWidget {
  final List<Loan> loans;
  final int capital;
  final Function refundLoan;

  LoanManagerView(
      {@required this.loans,
      @required this.capital,
      @required this.refundLoan});

  @override
  Widget build(BuildContext context) {
    return new ModuleLayout(
        title: "Capital / Prêt",
        subtitle:
            "Gérez intelligement votre business pour investir dans la production de lait et augmenter votre capital. Si vous manquez d'argent, vous pouvez faire un prêt !",
        child: new Column(children: [
          new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            new Container(
              height: 40.0,
              child: new Row(children: [
                new Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 20.0,
                    height: 48.0,
                    child: new Icon(
                      FontAwesomeIcons.piggyBank,
                      size: 20,
                    )),
                new Text(
                  "Capital : " + this.capital.toString() + "€",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            )
          ]),
          new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: generateLoanList())
        ]));
  }

  Iterable<Widget> generateLoanList() {
    if (this.loans.isNotEmpty) {
      return this
          .loans
          .map((l) => new LoanItem(
              loan: l, capital: this.capital, refundLoan: this.refundLoan))
          .toList();
    } else {
      return [
        new Text("Vous n'avez pas de prêt en cours ;-)",
            textAlign: TextAlign.left)
      ];
    }
  }
}
