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
  final int previousEnergyCount;

  // Cow Manager Module
  final int totalCowNumber;
  final double selectedCowNumber;
  final bool canMilkCows;

  // Milk Seller Manager
  final int milkLitters;
  final bool canSellMilk;
  final double selectedLitterPrice;
  final double sellingFactor;

  // Abrasion Module
  final int abrasion;

  // Loan Manager
  final List<Loan> loans;
  final int lastLoanId;
  final int selectedLoanAmount;
  final bool loanContracted;

  AppState(
      {this.isLoading = false,
      this.modules = const [],
      this.dayCount = 1,
      this.capital = 10000,
      this.milkPrice = 1,
      this.energyCount = 5,
      this.previousEnergyCount = 0,
      this.totalCowNumber = 10,
      this.selectedCowNumber = 0,
      this.canMilkCows = true,
      this.loans = const [
        Loan(
            leftLoan: initialValue,
            refundWeeksLeft: 60,
            weeklyInterests: 2,
            initialWeeksCount: 60,
            id: initialLoanId)
      ],
      this.lastLoanId = initialLoanId,
      this.milkLitters = 0,
      this.canSellMilk = true,
      this.selectedLitterPrice = 1,
      this.sellingFactor = 1,
      this.abrasion = 20,
      this.selectedLoanAmount = 0,
      this.loanContracted = false});

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
      int abrasion,
      int selectedLoanAmount,
      bool loanContracted,
      int lastLoandId,
      double sellingFactor, 
      int previousEnergyCount}) {
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
        sellingFactor : sellingFactor ?? this.sellingFactor,
        abrasion: abrasion ?? this.abrasion,
        selectedLoanAmount: selectedLoanAmount ?? this.selectedLoanAmount,
        loanContracted: loanContracted ?? this.loanContracted,
        lastLoanId: lastLoandId ?? this.lastLoanId,
        previousEnergyCount : previousEnergyCount ?? this.previousEnergyCount);
  }
}
