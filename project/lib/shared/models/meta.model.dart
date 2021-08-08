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
