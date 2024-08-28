import 'package:eyr_tools/eyr_tools.dart';
import 'package:eyr_tools/eyr_tools_method_channel.dart';
import 'package:eyr_tools/eyr_tools_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEyrToolsPlatform
    with MockPlatformInterfaceMixin
    implements EyrToolsPlatform {
  @override
  Stream<String> getOnTheAir() => throw UnimplementedError();

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EyrToolsPlatform initialPlatform = EyrToolsPlatform.instance;

  test('$MethodChannelEyrTools is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEyrTools>());
  });

  test('getPlatformVersion', () async {
    EyrTools eyrToolsPlugin = EyrTools();
    MockEyrToolsPlatform fakePlatform = MockEyrToolsPlatform();
    EyrToolsPlatform.instance = fakePlatform;

    expect(await eyrToolsPlugin.getPlatformVersion(), '42');
  });
}
