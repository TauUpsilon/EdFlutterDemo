import 'dart:convert';

mixin StringUtil {
  static String formateStrAsJson(dynamic json) =>
      JsonEncoder.withIndent('  ').convert(json);

  static String splitStrIntoLines(String input, int maxLen) {
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
