import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends BaseWidgetState<HomeWidget> {
  static const tabList = [
    {'name': 'User', 'url': '/user'},
    {'name': 'Demo', 'url': '/demo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black87,
          title: Text(
            'Home',
            style: TextStyle(fontSize: 13),
          ),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: tabList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(tabList[index]['url']);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            '${tabList[index]['name']} List',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  );
                })));
  }
}
