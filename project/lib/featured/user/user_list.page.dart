import 'package:flutter/material.dart';
import 'package:project/featured/user/user.service.dart';
import 'package:project/featured/user/user_detail.page.dart';
import 'package:project/main.locator.dart';
import 'package:project/shared/models/api_data.model.dart';
import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/models/user.model.dart';

var lastOffset = 0.0;

class UserListPageModel {
  final Stream<ApiData<User>> getUsers;

  UserListPageModel({this.getUsers});
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage>
    with AutomaticKeepAliveClientMixin {
  // var _scrollCtrl = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'User List',
            style: TextStyle(fontSize: 13),
          ),
        ),
        body: StreamBuilder<UserListPageModel>(
            stream: Stream<UserListPageModel>.value(UserListPageModel(
                getUsers: locator.get<UserService>().getUsers('page=1'))),
            builder: (BuildContext context,
                AsyncSnapshot<UserListPageModel> snapshot) {
              if (snapshot.hasData) {
                return StreamBuilder<ApiData<User>>(
                    stream: snapshot.data.getUsers,
                    builder: (BuildContext context,
                        AsyncSnapshot<ApiData<User>> snapshot) {
                      if (snapshot.hasData) {
                        var res = snapshot.data;

                        switch (res.status) {
                          case ResponseStatus.LOADING:
                            return Container(
                              child: Center(
                                child: Text('Loading'),
                              ),
                            );

                          case ResponseStatus.SUCCESS:
                            var dataSet = res.collection.data;

                            return Container(
                                padding: EdgeInsets.all(4),
                                child: ListView.builder(
                                  itemCount: dataSet.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            '/user/user_detail',
                                            arguments: dataSet[index]);
                                      },
                                      child: Card(
                                        color: index % 2 == 0
                                            ? Colors.grey[200]
                                            : Colors.grey[800],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            title: Text(
                                              'User $index - ${dataSet[index].NAME}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: index % 2 == 0
                                                      ? Colors.grey[800]
                                                      : Colors.grey[200]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  // separatorBuilder: (context, index) {
                                  //   return Divider();
                                  // },
                                ));

                          default:
                            return Container(
                              child: Center(
                                child: Text('Default'),
                              ),
                            );
                        }
                      }

                      return Container(
                        child: Center(
                          child: Text('Loading'),
                        ),
                      );
                    });
              }

              return Container(
                child: Center(
                  child: Text('Loading'),
                ),
              );
            }));
  }

  @override
  bool get wantKeepAlive => true;
}
