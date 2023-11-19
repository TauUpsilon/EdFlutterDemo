part of 'home.page.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  HomeInitial.init() : super();
}
