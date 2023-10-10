part of 'global_reducer.redux.dart';

class GlobalState {
  final MaskReduxState mask;
  final RouterReduxState router;

  GlobalState({
    required this.mask,
    required this.router,
  });

  GlobalState.initialState()
      : mask = MaskReduxState.initialState(),
        router = RouterReduxState.initialState();
}
