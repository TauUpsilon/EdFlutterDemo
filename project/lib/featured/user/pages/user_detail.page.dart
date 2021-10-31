import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:project/shared/models/user.model.dart';

class UserDetailPage extends StatefulWidget {
  final User user;

  const UserDetailPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends BaseWidgetState<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'User List',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(2),
        child: Container(
          child: Center(
            child: Text(widget.user.NAME),
          ),
        ),
      ),
    );
  }
}
