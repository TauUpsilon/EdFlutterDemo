import 'dart:convert';

mixin StringUtil {
  static String prettyJson(Object? json) =>
      const JsonEncoder.withIndent('  ').convert(json);

  static String prettyLog(String title, Map<String, dynamic> content) {
    final body = content.entries.map((e) => '${e.key}: ${e.value}');
    return ['$title\n', ...body].join('\n');
  }
}
