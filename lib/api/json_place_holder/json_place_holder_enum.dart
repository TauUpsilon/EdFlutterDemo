enum JsonPlaceHolder {
  ezwt0000,
}

extension JsonPlaceHolderStatusExt on JsonPlaceHolder {
  String get code => switch (this) {
        JsonPlaceHolder.ezwt0000 => 'EZWT0000',
      };

  static JsonPlaceHolder? get(String code) => switch (code) {
        'EZWT0000' => JsonPlaceHolder.ezwt0000,
        _ => null,
      };
}
