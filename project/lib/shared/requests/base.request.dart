enum RequestMethod {
  GET,
  POST,
  PUT,
  DELETE,
}

enum RequestScope {
  GOREST,
  UBIKE,
}

class BaseRequest {
  RequestScope? SCOPE;
  RequestMethod? METHOD;
  String? NAME;
  String? URI;
}
