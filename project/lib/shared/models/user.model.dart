import 'package:project/shared/decorators/imitable.decorator.dart';

@imitable
class User {
  int id;
  String name;
  String email;
  String gender;
  String status;
  bool selected;

  User(this.id, this.name, this.email, this.gender, this.status);

  static fromJson(Map<String, dynamic> json) => User(
      json['id'], json['name'], json['email'], json['gender'], json['status']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'gender': gender,
        'status': status
      };
}
