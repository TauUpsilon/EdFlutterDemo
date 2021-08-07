import 'package:flutter/material.dart';
import 'package:project/main.locator.dart';
import 'package:project/main.model.dart';
import 'package:project/main.service.dart';
import 'package:project/main.state.dart';
import 'package:redux/redux.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var mainService = locator.get<MainService>();

    // mainService.fetchDataStore().listen((res) {
    //   print(res.state.apiResponse.body.data);
    // });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('API'),
            centerTitle: true,
          ),
          body: StreamBuilder<Store<AppState<User>>>(
              stream: locator.get<MainService>().fetchDataStore(),
              builder: (BuildContext context,
                  AsyncSnapshot<Store<AppState<User>>> snapshot) {
                if (snapshot.hasData) {
                  var res = snapshot.data;

                  switch (res.state.apiResponse.status) {
                    case ResponseStatus.LOADING:
                      return Container(
                        child: Center(
                          child: Text('Loading'),
                        ),
                      );

                    case ResponseStatus.SUCCESS:
                      var dataSet = res.state.apiResponse.body.data;

                      return Container(
                          padding: EdgeInsets.all(12),
                          child: ListView.builder(
                            itemCount: dataSet.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Card(
                                  color: index % 2 == 0
                                      ? Colors.grey[200]
                                      : Colors.grey[800],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text(
                                        'User $index - ${dataSet[index].name}',
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
                } else {
                  return Container(
                    child: Center(
                      child: Text('Loading'),
                    ),
                  );
                }
              })),
    );
  }
}
