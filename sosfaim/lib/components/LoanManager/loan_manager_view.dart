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
              padding:
                  const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
              child: new Row(children: [
                new Container(
                    width: 48.0,
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
          new Column(children: generateLoanList())
        ]));
  }

  Iterable<Widget> generateLoanList() => this
      .loans
      .map((l) => new LoanItem(
          loan: l, capital: this.capital, refundLoan: this.refundLoan))
      .toList();
}
