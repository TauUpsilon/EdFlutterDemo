enum RequestMethod {
  GET,
  POST,
  PUT,
  DELETE,
}

class BaseRequest {
  RequestMethod METHOD;
  String NAME;
  String URI;
}
