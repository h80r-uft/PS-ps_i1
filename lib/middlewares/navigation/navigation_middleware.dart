import 'package:redux/redux.dart';

import 'package:ps_i1/keys.dart';
import 'package:ps_i1/store/app_state.dart';

import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    final currentState = Keys.navigationKey.currentState;
    if (action is NavigateTo && currentState != null) {
      currentState.pushNamed(action.routeName);
    } else if (action is NavigateBack && currentState != null) {
      currentState.pop();
    }
    next(action);
  }
}
