class CommonDone<T> {
  String code;
  T data;

  CommonDone({
    required this.code,
    required this.data,
  });
}

class CommonFail {
  String code;
  String message;

  CommonFail({
    required this.code,
    required this.message,
  });
}
