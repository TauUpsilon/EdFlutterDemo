abstract class ApnRoute {
  final ApnRoute? _parent;

  ApnRoute({
    ApnRoute? parent,
  }) : _parent = parent;

  String get path;
  String get name => fullpath;
  String get fullpath => '${_parent?.fullpath ?? ''}/$path';
}
