// We create the State reducer by combining many smaller reducers into one!
import 'package:redux/redux.dart';
import 'package:sosfaim/models/app_state.dart';

AppState cowModuleReducer(AppState state, action) {
  return combineReducers<AppState>([
   
  ])(state, action);
}
