import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'eyr_tools_method_channel.dart';

abstract class EyrToolsPlatform extends PlatformInterface {
  /// Constructs a EyrToolsPlatform.
  EyrToolsPlatform() : super(token: _token);

  static final Object _token = Object();

  static EyrToolsPlatform _instance = MethodChannelEyrTools();

  /// The default instance of [EyrToolsPlatform] to use.
  ///
  /// Defaults to [MethodChannelEyrTools].
  static EyrToolsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EyrToolsPlatform] when
  /// they register themselves.
  static set instance(EyrToolsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<String> getOnTheAir() {
    throw UnimplementedError('OnTheAir() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
