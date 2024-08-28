import 'eyr_tools_platform_interface.dart';

class EyrTools {
  static Stream<String> getOnTheAir() {
    return EyrToolsPlatform.instance.getOnTheAir();
  }

  Future<String?> getPlatformVersion() {
    return EyrToolsPlatform.instance.getPlatformVersion();
  }
}
