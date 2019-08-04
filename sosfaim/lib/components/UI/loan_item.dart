import 'package:flutter/material.dart';
import 'package:sosfaim/models/loan.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoanItem extends StatelessWidget {
  final Loan loan;
  final int capital;
  final Function refundLoan;

  LoanItem(
      {@required this.loan, @required this.capital, @required this.refundLoan});

  Function onRefund(loan) {
    this.refundLoan(this.loan);
  }

  @override
  Widget build(BuildContext context) {
    int percentage =
        (this.loan.refundWeeksLeft / this.loan.initialWeeksCount * 100).toInt();

    Function refundButtonPressed =
        this.capital >= this.loan.leftLoan ? () => onRefund(this.loan) : null;

    int amountLeft = this.loan.leftLoan;

    return new Container(
        height: 40.0,
        padding: const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
        child: new Row(children: <Widget>[
          new Container(
              width: 48.0,
              height: 48.0,
              child: new Icon(
                FontAwesomeIcons.moneyBillAlt,
                size: 20,
              )),
          new Expanded(
              child: new Stack(children: <Widget>[
            new Container(
                height: 40.0,
                child: new LinearProgressIndicator(
                    value: percentage * 1.0,
                    backgroundColor: Colors.grey,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent))),
            new Container(
                height: 40.0,
                child: new Align(
                    alignment: Alignment.center,
                    child: new Text(
                      '$amountLeft €',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )))
          ])),
          new FlatButton(
            disabledColor: Colors.grey,
            child: new Text("Rembourser"),
            onPressed: refundButtonPressed,
          )
        ]));
  }
}
