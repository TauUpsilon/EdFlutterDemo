import 'package:project/shared/models/meta.model.dart';

enum ResponseStatus { SUCCESS, FAILURE, LOADING }

class DataRoom {
  ResponseStatus status;
  Map<String, Collection<dynamic>> collections;

  DataRoom({this.status, this.collections});

  factory DataRoom.initial() => DataRoom(status: null, collections: new Map());
}

class Collection<T> {
  Meta meta;
  List<T> data;

  Collection({this.meta, this.data});

  factory Collection.initial() => Collection(meta: new Meta(), data: []);
}
