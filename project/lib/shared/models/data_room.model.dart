import 'package:project/shared/models/meta.model.dart';

enum ResponseStatus { SUCCESS, FAILURE, LOADING }

class DataRoom {
  ResponseStatus? STATUS;
  Map<String, Collection<dynamic>>? COLLECTIONS;

  DataRoom({
    this.STATUS,
    this.COLLECTIONS,
  });

  static initial() {
    return DataRoom(
      STATUS: null,
      COLLECTIONS: new Map(),
    );
  }
}

class Collection<T> {
  Meta? META;
  List<T>? DATA;

  Collection({
    this.META,
    this.DATA,
  });

  static initial() {
    return Collection(
      META: new Meta(),
      DATA: [],
    );
  }
}
