import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'eyr_tools_platform_interface.dart';

/// An implementation of [EyrToolsPlatform] that uses method channels.
class MethodChannelEyrTools extends EyrToolsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('eyr_tools');

  @override
  Stream<String> getOnTheAir() => const EventChannel('eyr_tools_on_the_air')
      .receiveBroadcastStream()
      .map((event) => event as String);

  @override
  Future<String?> getPlatformVersion() async {
    return methodChannel.invokeMethod<String>('getPlatformVersion');
  }
}
