import 'package:flutter/material.dart';

class Chart_Bars extends StatelessWidget {
  final String date_tx;
  final double moneySpend;
  final double amountSpendPercentage;
  Chart_Bars(this.date_tx, this.moneySpend, this.amountSpendPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 15,
          child: FittedBox(child: Text("₹ ${moneySpend.toStringAsFixed(0)}"))),
      SizedBox(height: 4),
      Container(
        height: 80,
        width: 15,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(220, 220, 220, 1),
            ),
          ),
          FractionallySizedBox(
            heightFactor: amountSpendPercentage,
            child: Container(
                decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(15),
            )),
          )
        ]),
      ),
      SizedBox(height: 4),
      Text(date_tx)
    ]);
  }
}
