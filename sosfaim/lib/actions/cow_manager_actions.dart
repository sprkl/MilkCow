import 'package:flutter/material.dart';

class UpdateSelectedCowNumber {
  final double selectedCowNumber;
  
  UpdateSelectedCowNumber(this.selectedCowNumber);
}

class BuyCow {
  final int cowCount;
  final int totalCost;

  BuyCow(this.cowCount, this.totalCost);
}

class SellCow {
  final int cowCount;
  final int totalCost;

  SellCow(this.cowCount, this.totalCost);
}

class MilkCows {
  final BuildContext context;

  MilkCows(this.context);
}