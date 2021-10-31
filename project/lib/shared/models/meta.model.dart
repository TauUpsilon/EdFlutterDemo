class Meta {
  final Pagination PAGINATION;

  Meta({
    this.PAGINATION,
  });

  static fromJson(Map<String, dynamic> json) {
    return Meta(
      PAGINATION: Pagination.fromJson(
        json['pagination'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pagination': PAGINATION.toJson(),
    };
  }
}

class Pagination {
  final int TOTAL;
  final int PAGES;
  final int PAGE;
  final int LIMIT;
  final Links LINKS;

  Pagination({
    this.TOTAL,
    this.PAGES,
    this.PAGE,
    this.LIMIT,
    this.LINKS,
  });

  static fromJson(Map<String, dynamic> json) {
    return Pagination(
      TOTAL: json['total'],
      PAGES: json['pages'],
      PAGE: json['page'],
      LIMIT: json['limit'],
      LINKS: Links.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': TOTAL,
      'pages': PAGES,
      'page': PAGE,
      'limit': LIMIT,
      'links': LINKS.toJson(),
    };
  }
}

class Links {
  final String PREVIOUS;
  final String CURRENT;
  final String NEXT;

  Links({
    this.PREVIOUS,
    this.CURRENT,
    this.NEXT,
  });

  static fromJson(Map<String, dynamic> json) {
    return Links(
      PREVIOUS: json['previous'],
      CURRENT: json['current'],
      NEXT: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'previous': PREVIOUS,
      'current': CURRENT,
      'next': NEXT,
    };
  }
}
