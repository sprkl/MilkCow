import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sosfaim/components/UI/loan_item.dart';
import 'package:sosfaim/components/UI/module_layout.dart';
import 'package:sosfaim/models/loan.dart';

class LoanManagerView extends StatelessWidget {
  final List<Loan> loans;
  final int capital;
  final Function refundLoan;
  final int selectedLoanAmount;
  final Function onLoanAmountChanged;
  final Function contractLoan;
  final bool loanContracted;
  final int energyCount;

  LoanManagerView(
      {@required this.loans,
      @required this.capital,
      @required this.refundLoan,
      @required this.selectedLoanAmount,
      @required this.onLoanAmountChanged,
      @required this.contractLoan,
      @required this.loanContracted,
      @required this.energyCount});

  @override
  Widget build(BuildContext context) {
    return new ModuleLayout(
        title: "Capital / Prêt",
        subtitle:
            "Gérez intelligement votre business pour investir dans la production de lait et augmenter votre capital. Si vous manquez d'argent, vous pouvez faire un prêt !",
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              children: generateLoanList()),
          buildLoanContractor(),
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

  Widget buildLoanContractor() {
    if (this.loanContracted) {
      return Text("Vous avez déjà contracté un prêt aujourd'hui.");
    } else {
      bool canContractLoan = this.selectedLoanAmount > 0;
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        new Container(
            height: 40.0,
            padding: const EdgeInsets.only(top: 10.0),
            child: new Row(children: <Widget>[
              new Text("Emprunter :"),
              new Expanded(
                  child: new Slider(
                      min: 0,
                      divisions: 5000,
                      max: 100000,
                      value: selectedLoanAmount.toDouble(),
                      onChanged: onLoanAmountChanged))
            ])),
        new Visibility(
            visible: canContractLoan,
            child: new RaisedButton(
                elevation: 2,
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text('Emprunter $selectedLoanAmount: -1'),
                    new Image.asset(
                      'assets/images/energy_icon.png',
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onPressed: energyCount > 1 ? this.contractLoan:null))
      ]);
    }
  }
}
