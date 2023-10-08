part of 'global_reducer.redux.dart';

class GlobalState {
  final MaskReduxState mask;

  GlobalState({required this.mask});

  GlobalState.initialState() : mask = MaskReduxState.initialState();
}
