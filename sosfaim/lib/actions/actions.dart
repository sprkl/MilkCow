import 'package:flutter/material.dart';

class AddCapital {
  final int amount;

  AddCapital(this.amount);
}

class UpdateMilkPrice {
  final double price;

  UpdateMilkPrice(this.price);
}

class UpdateMilkProduction {
  final int production;

  UpdateMilkProduction(this.production);
}

class IncrementDay {
  final BuildContext context;

  IncrementDay(this.context);
}
