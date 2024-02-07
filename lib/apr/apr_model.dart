abstract class AppRoute {
  final AppRoute? _parent;

  AppRoute({
    AppRoute? parent,
  }) : _parent = parent;

  String get path;
  String get name => fullpath;
  String get fullpath => '${_parent?.fullpath ?? ''}/$path';
}
