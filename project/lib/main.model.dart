class BaseModel {
  BaseModel();

  static BaseModel initial() {
    print('base');
    return BaseModel();
  }

  static BaseModel fromJson(Map<String, dynamic> json) => BaseModel();

  // fromJson(Map<String, dynamic> json) {
  //   return BaseModel.fromJson(json);
  // }

  Map<String, dynamic> toJson() => {};
}

class ApiResponse<T> {
  ResponseStatus status;
  ResponseBody<T> body;

  ApiResponse({this.status, this.body});

  factory ApiResponse.initial() =>
      ApiResponse(status: null, body: ResponseBody.initial());

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      ApiResponse(status: null, body: ResponseBody.fromJson(json));
}

enum ResponseStatus { SUCCESS, FAILURE, LOADING }

class ResponseBody<T> {
  Meta meta;
  List<T> data;

  ResponseBody({this.meta, this.data});

  factory ResponseBody.initial() => ResponseBody(meta: new Meta(), data: []);

  factory ResponseBody.fromJson(Map<String, dynamic> json) =>
      ResponseBody(meta: Meta.fromJson(json['meta']), data: json['data']);
}

class Meta {
  final Pagination pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json)
      : pagination = Pagination.fromJson(json['pagination']);

  Map<String, dynamic> toJson() => {'pagination': pagination.toJson()};
}

class Pagination {
  final int total;
  final int pages;
  final int page;
  final int limit;
  final Links links;

  Pagination({this.total, this.pages, this.page, this.limit, this.links});

  Pagination.fromJson(Map<String, dynamic> json)
      : total = json['total'],
        pages = json['pages'],
        page = json['page'],
        limit = json['limit'],
        links = Links.fromJson(json['links']);

  Map<String, dynamic> toJson() => {
        'total': total,
        'pages': pages,
        'page': page,
        'limit': limit,
        'links': links.toJson()
      };
}

class Links {
  final String previous;
  final String current;
  final String next;

  Links({this.previous, this.current, this.next});

  Links.fromJson(Map<String, dynamic> json)
      : previous = json['previous'],
        current = json['current'],
        next = json['next'];

  Map<String, dynamic> toJson() =>
      {'previous': previous, 'current': current, 'next': next};
}

class User extends BaseModel {
  int id;
  String name;
  String email;
  String gender;
  String status;
  bool selected;

  User(this.id, this.name, this.email, this.gender, this.status, this.selected);

  static BaseModel initial() {
    print('user');
    return User(0, '', '', '', '', false);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        gender = json['gender'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'gender': gender,
        'status': status
      };
}
