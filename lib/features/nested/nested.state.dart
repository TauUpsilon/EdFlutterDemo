part of 'nested.page.dart';

@immutable
sealed class NestedState {
  final String text;

  const NestedState({required this.text});
}

final class NetworkInitial extends NestedState {
  NetworkInitial.init() : super(text: 'NestedState');
}
