import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class DemoListPage extends StatefulWidget {
  @override
  _DemoListPageState createState() => _DemoListPageState();
}

class _DemoListPageState extends BaseWidgetState<DemoListPage> {
  static const tabList = [
    {
      'name': 'RX',
      'url': '/demo/rx',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'Demo List',
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        child: ListView.builder(
          itemCount: tabList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  tabList[index]['url'],
                );
              },
              child: Card(
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      '${tabList[index]['name']} Demo',
                      style: TextStyle(
                        fontSize: 20,
                        color: index % 2 == 0
                            ? Colors.grey[800]
                            : Colors.grey[200],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
