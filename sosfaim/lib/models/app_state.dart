import 'package:sosfaim/modules/module.dart';

class AppState {
  final bool isLoading;
  final List<IModule> modules;
  final int dayCount;
  final int capital;
  final double milkPrice;
  final int milkProduction;

  final int totalCowNumber;
  final double selectedCowNumber;

  AppState(
      {this.isLoading = false,
      this.modules = const [],
      this.dayCount = 1,
      this.capital = 1000,
      this.milkPrice = 1,
      this.milkProduction = 0,
      this.totalCowNumber = 10,
      this.selectedCowNumber = 0});

  AppState copyWith(
      {bool isLoading,
      List<IModule> modules,
      int dayCount,
      int capital,
      double milkPrice,
      int milkProduction,
      int totalCowNumber,
      double selectedCowNumber}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        modules: modules ?? this.modules,
        dayCount: dayCount ?? this.dayCount,
        capital: capital ?? this.capital,
        milkPrice: milkPrice ?? this.milkPrice,
        milkProduction: milkProduction ?? this.milkProduction,
        totalCowNumber: totalCowNumber ?? this.totalCowNumber,
        selectedCowNumber: selectedCowNumber ?? this.selectedCowNumber
        );
  }
}
