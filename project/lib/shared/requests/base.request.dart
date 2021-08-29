enum RequestMethod { GET, POST, PUT, DELETE }

class BaseRequest {
  RequestMethod method;
  String name;
  String uri;
}
