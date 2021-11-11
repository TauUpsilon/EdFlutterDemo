import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class CloneListPage extends StatefulWidget {
  @override
  _CloneListPageState createState() => _CloneListPageState();
}

class _CloneListPageState extends BaseWidgetState<CloneListPage> {
  static const tabList = [
    {
      'name': 'UBike',
      'url': '/demo/clone/ubike',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'Clones',
          style: TextStyle(fontSize: 20),
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
                  tabList[index]['url']!,
                );
              },
              child: Card(
                color: index % 2 == 0 ? Colors.grey[200] : Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      '${tabList[index]['name']}',
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
