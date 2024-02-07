part of 'home.page.dart';

@immutable
sealed class HomeState {
  final String title;
  final String body;

  const HomeState({
    required this.title,
    required this.body,
  });
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.title, required super.body});

  factory HomeInitial.init() => const HomeInitial(title: '', body: '');
  factory HomeInitial.copyWith({
    required String title,
    required String body,
  }) =>
      HomeInitial(
        title: title,
        body: body,
      );
}
