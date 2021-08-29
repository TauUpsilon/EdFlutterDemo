import 'package:project/shared/decorators/imitable.decorator.dart';
import 'package:project/shared/models/data_room.model.dart';

@imitable
class ApiData<T> {
  ResponseStatus status;
  Collection<T> collection;

  ApiData(this.status, this.collection);
}
