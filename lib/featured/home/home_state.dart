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

  HomeState copyWith({
    String? title,
    String? body,
  }) =>
      HomeInstance(
        title: title ?? this.title,
        body: body ?? this.body,
      );

  @override
  List<Object?> get props => [
        title,
        body,
      ];
}

final class HomeInstance extends HomeState {
  const HomeInstance({
    required super.title,
    required super.body,
  });
}
