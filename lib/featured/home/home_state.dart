part of 'home_view.dart';

@immutable
sealed class HomeState with EquatableMixin {
  final String title;
  final String body;

  const HomeState({
    required this.title,
    required this.body,
  });

  factory HomeState.init() => const HomeInstance(
        title: '',
        body: '',
      );

  factory HomeState.copyWith({
    required String title,
    required String body,
  }) =>
      HomeInstance(
        title: title,
        body: body,
      );
}

final class HomeInstance extends HomeState {
  const HomeInstance({
    required super.title,
    required super.body,
  });

  @override
  List<Object?> get props => [
        super.title,
        super.body,
      ];
}
