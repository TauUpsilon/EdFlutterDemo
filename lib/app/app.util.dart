part of 'app.widget.dart';

mixin AppUtil {
  static String getJsonString(dynamic json) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }

  static String splitStringIntoLines(String input, int maxLen) {
    final result = StringBuffer();
    var index = 0;

    while (index < input.length) {
      final remainChars = input.length - index;
      final lineLength = remainChars < maxLen ? remainChars : maxLen;
      final line = input.substring(index, index + lineLength);

      result.write(line);

      index += lineLength;

      if (index < input.length) {
        result.write('\n');
      }
    }

    return result.toString();
  }
}
