

class AddCapital{
  final int amount;

  AddCapital(this.amount);
}

class UpdateMilkPrice{
  final double price;

  UpdateMilkPrice(this.price);
}

class UpdateMilkProduction{
  final int production;

  UpdateMilkProduction(this.production);
}

class IncrementDay{}

class UpdateSelectedCowNumber {
  final double selectedCowNumber;
  final String cowButtonText;
  
  UpdateSelectedCowNumber(this.selectedCowNumber, this.cowButtonText);
}