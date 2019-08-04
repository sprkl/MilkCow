import 'package:sosfaim/modules/module.dart';

import 'loan.dart';

const initialValue = 10000;
const initialLoanId = 1;

class AppState {
  final bool isLoading;
  final List<IModule> modules;
  final int dayCount;
  final int capital;
  final double milkPrice;

  // Energy Manager
  final int energyCount;

  // Cow Manager Module
  final int totalCowNumber;
  final double selectedCowNumber;
  final bool canMilkCows;

  // Milk Seller Manager
  final int milkLitters;
  final bool canSellMilk;
  final double selectedLitterPrice;

  // Abrasion Module
  final int abrasion;

  // Loan Manager
  final List<Loan> loans;
  final int lastLoanId;

  AppState(
      {this.isLoading = false,
      this.modules = const [],
      this.dayCount = 1,
      this.capital = 10000,
      this.milkPrice = 1,
      this.energyCount = 3,
      this.totalCowNumber = 10,
      this.selectedCowNumber = 0,
      this.canMilkCows = true,
      this.loans = const [
        Loan(
            leftLoan: initialValue,
            refundWeeksLeft: 60,
            weeklyInterests: 10,
            initialWeeksCount: 60,
            id: initialLoanId)
      ],
      this.lastLoanId = initialLoanId,
      this.milkLitters = 0,
      this.canSellMilk = true,
      this.selectedLitterPrice = 1,
      this.abrasion = 20});

  AppState copyWith(
      {bool isLoading,
      List<IModule> modules,
      int dayCount,
      int capital,
      double milkPrice,
      int energyCount,
      int totalCowNumber,
      double selectedCowNumber,
      bool canMilkCows,
      List<Loan> loans,
      int milkLitters,
      bool canSellMilk,
      double selectedLitterPrice,
      int abrasion}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        modules: modules ?? this.modules,
        dayCount: dayCount ?? this.dayCount,
        capital: capital ?? this.capital,
        milkPrice: milkPrice ?? this.milkPrice,
        energyCount: energyCount ?? this.energyCount,
        totalCowNumber: totalCowNumber ?? this.totalCowNumber,
        selectedCowNumber: selectedCowNumber ?? this.selectedCowNumber,
        canMilkCows: canMilkCows ?? this.canMilkCows,
        loans: loans ?? this.loans,
        milkLitters: milkLitters ?? this.milkLitters,
        canSellMilk: canSellMilk ?? this.canSellMilk,
        selectedLitterPrice: selectedLitterPrice ?? this.selectedLitterPrice,
        abrasion: abrasion ?? this.abrasion);
  }
}
