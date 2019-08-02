// We create the State reducer by combining many smaller reducers into one!
import 'package:sosfaim/models/app_state.dart';

AppState cowModuleReducer(AppState state, action) {
  return AppState(
      isLoading: state.isLoading,
      modules: state.modules,
      dayCount: state.dayCount,
      capital: state.capital,
      milkPrice: state.milkPrice,
      milkProduction: state.milkProduction);
}
