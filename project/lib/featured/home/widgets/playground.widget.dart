import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:rxdart/rxdart.dart';

class PlaygroundWidget extends StatefulWidget {
  @override
  _PlaygroundWidgetState createState() => _PlaygroundWidgetState();
}

class _PlaygroundWidgetState extends BaseWidgetState<PlaygroundWidget> {
  static const data = {
    'king': {'name': 'KING', 'said': 'I am the king'},
    'queen': {'name': 'QUEEN', 'said': 'I am the queen'}
  };

  var subject = new BehaviorSubject<Map<String, String>>();

  // void onSubject() {
  //   var subject = new BehaviorSubject<Map<String, Map<String, String>>>();
  // }

  @override
  void initState() {
    super.initState();

    subject.listen((value) {
      print(value);
    });

    subject.add(data['king']);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Playground',
              style: TextStyle(fontSize: 13),
            ),
            backgroundColor: Colors.black87,
            bottom: TabBar(
              onTap: (val) {
                print(val);
              },
              tabs: [
                Tab(
                  text: 'KING',
                ),
                Tab(
                  text: ' QUEEN',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Text('KING'),
              Text('QUEEN'),
            ],
          ),
        ));
  }
}
