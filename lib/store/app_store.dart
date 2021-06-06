import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:ps_i1/store/app_reducer.dart';
import 'package:ps_i1/store/app_state.dart';

import 'package:ps_i1/middlewares/navigation/navigation_middleware.dart';

/// *Store* que gera e fornece o estado
/// da aplicação.
Store<AppState> createAppStore() {
  return Store(
    appReducer,
    initialState: AppState.inital(),
    middleware: [
      thunkMiddleware,
      NavigationMiddleware(),
    ],
  );
}
