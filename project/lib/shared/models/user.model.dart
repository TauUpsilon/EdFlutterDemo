import 'package:project/shared/decorators/imitable.decorator.dart';

@imitable
class User {
  int ID;
  String NAME;
  String EMAIL;
  String GENDER;
  String STATUS;

  User({
    this.ID,
    this.NAME,
    this.EMAIL,
    this.GENDER,
    this.STATUS,
  });

  static fromJson(Map<String, dynamic> json) {
    return User(
      ID: json['id'],
      NAME: json['name'],
      EMAIL: json['email'],
      GENDER: json['gender'],
      STATUS: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': ID,
      'name': NAME,
      'email': EMAIL,
      'gender': GENDER,
      'status': STATUS,
    };
  }
}
