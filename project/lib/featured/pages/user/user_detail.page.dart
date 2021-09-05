import 'package:flutter/material.dart';
import 'package:project/shared/models/user.model.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User List',
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(2),
          child: Container(
            child: Center(
              child: Text(user.NAME),
            ),
          )),
    );
  }
}
