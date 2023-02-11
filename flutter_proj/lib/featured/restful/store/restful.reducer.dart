import 'package:flutter_proj/featured/restful/store/restful.action.dart';
import 'package:flutter_proj/featured/restful/store/restful.state.dart';

RestfulState restfulReducer(RestfulState prev, dynamic action) {
  if (action is GetPartOne) {
    return RestfulState(action.mbm081018model);
  } else {
    return prev;
  }
}
