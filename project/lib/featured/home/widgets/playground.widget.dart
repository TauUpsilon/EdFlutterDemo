import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/transformers/switch_map.dart';
import 'package:rxdart/subjects.dart';

class PlaygroundWidget extends StatefulWidget {
  @override
  _PlaygroundWidgetState createState() => _PlaygroundWidgetState();
}

class _PlaygroundWidgetState extends BaseWidgetState<PlaygroundWidget> {
  @override
  void initState() {
    super.initState();

    var subject = new BehaviorSubject();
    var sourceOneStream = new Stream.fromIterable([1, 1, 3]);
    var sourceTwoStream = new Stream.fromIterable([4, 5, 6]);
    var sourceThreeStream = new Stream.fromIterable([
      {'type': 'one', 'name': 'A'},
      {'type': 'one', 'name': 'B'},
      {'type': 'two', 'name': 'C'},
    ]);
    var mergeList = [sourceOneStream, sourceTwoStream];

    subject
        .switchMap(
          (_) => sourceThreeStream,
        )
        .groupBy((value) => value['type'])
        .bufferCount(mergeList.length)
        .listen(
      (value) {
        value.forEach((element) {
          print(element);
        });
      },
    );

    subject.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Playground',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(child: Container()),
    );
  }
}
