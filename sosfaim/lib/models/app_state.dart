import 'package:sosfaim/modules/module.dart';

import 'loan.dart';

const initialValue = 10000;

class AppState {
  final bool isLoading;
  final List<IModule> modules;
  final int dayCount;
  final int capital;
  final double milkPrice;
  final int milkProduction;

  // Cow Manager Module
  final int totalCowNumber;
  final double selectedCowNumber;
  final bool canMilkCows;

  // Abrasion Module
  final int abrasion;

  // Loan Manager
  final List<Loan> loans;

  AppState(
      {this.isLoading = false,
      this.modules = const [],
      this.dayCount = 1,
      this.capital = 10000,
      this.milkPrice = 1,
      this.milkProduction = 0,
      this.totalCowNumber = 10,
      this.selectedCowNumber = 0,
      this.canMilkCows = true,
      this.abrasion = 20,
      this.loans = const [
        Loan(leftLoan: initialValue, refundWeeksLeft: 60, weeklyInterests: 10)
      ]});

  AppState copyWith(
      {bool isLoading,
      List<IModule> modules,
      int dayCount,
      int capital,
      double milkPrice,
      int milkProduction,
      int totalCowNumber,
      double selectedCowNumber,
      bool canMilkCows,
      int abrasion,
      List<Loan> loans}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        modules: modules ?? this.modules,
        dayCount: dayCount ?? this.dayCount,
        capital: capital ?? this.capital,
        milkPrice: milkPrice ?? this.milkPrice,
        milkProduction: milkProduction ?? this.milkProduction,
        totalCowNumber: totalCowNumber ?? this.totalCowNumber,
        selectedCowNumber: selectedCowNumber ?? this.selectedCowNumber,
        canMilkCows: canMilkCows ?? this.canMilkCows,
        abrasion: abrasion ?? this.abrasion,
        loans: loans ?? this.loans);
  }
}
