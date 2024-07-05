part of 'network_view.dart';

@immutable
sealed class NetworkState with EquatableMixin {
  const NetworkState();

  factory NetworkState.init() => const NetworkInstance();

  NetworkState copyWith() => const NetworkInstance();

  @override
  List<Object?> get props => [];
}

final class NetworkInstance extends NetworkState {
  const NetworkInstance();
}
