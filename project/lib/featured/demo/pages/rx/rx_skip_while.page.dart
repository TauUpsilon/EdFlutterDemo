import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:rxdart/rxdart.dart';

class RXSkipWhileOperatorPage extends StatefulWidget {
  @override
  _RXSkipWhileOperatorPageState createState() =>
      _RXSkipWhileOperatorPageState();
}

class _RXSkipWhileOperatorPageState
    extends BaseWidgetState<RXSkipWhileOperatorPage> {
  static const source = [
    {
      'status': 'loading',
      'value': null,
    },
    {
      'status': 'done',
      'value': {
        'name': 'Edward',
        'gender': 'Male',
      },
    }
  ];

  var userSubject = new BehaviorSubject();

  formatUserData(Map<String, Object> res) {
    String outputString;

    if (res['status'] == 'done') {
      var value = res['value'] as Map<String, Object>;

      outputString = '${value['name']} - ${value['gender']}';
    }

    return Stream.value(outputString);
  }

  @override
  void initState() {
    super.initState();

    var userStream = new Stream.fromIterable(source);

    userSubject
        .switchMap((value) => userStream
            .skipWhile((element) => element['status'] == 'loading')
            .switchMap((res) => formatUserData(res)))
        .listen((event) => print(event));

    userSubject.add(null);
  }

  @override
  void dispose() {
    super.dispose();

    this.userSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RX Switch Map Operator',
          style: TextStyle(fontSize: 13),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(child: Container()),
    );
  }
}
