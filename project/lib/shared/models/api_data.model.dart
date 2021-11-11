import 'package:project/shared/decorators/imitable.decorator.dart';
import 'package:project/shared/models/data_room.model.dart';

@imitable
class ApiData<T> {
  ResponseStatus? STATUS;
  Collection<T>? COLLECTION;

  ApiData({
    this.STATUS,
    this.COLLECTION,
  });
}
