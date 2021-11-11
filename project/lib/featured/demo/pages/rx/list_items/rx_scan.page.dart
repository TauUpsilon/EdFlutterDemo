import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:rxdart/rxdart.dart';

class RXScanOperatorPage extends StatefulWidget {
  @override
  _RXScanOperatorPageState createState() => _RXScanOperatorPageState();
}

class _RXScanOperatorPageState extends BaseWidgetState<RXScanOperatorPage> {
  static List<Map<String, dynamic>> source = [
    {
      'name': 'Taiwan',
      'year': '2020',
      'population': 23816775,
    },
    {
      'name': 'Australia',
      'year': '2020',
      'population': 25499884,
    },
    {
      'name': 'Japan',
      'year': '2020',
      'population': 126476461,
    },
  ];

  var sourceSubject = new BehaviorSubject();

  @override
  void initState() {
    super.initState();

    var sourceStream = new Stream.fromIterable(source);

    sourceSubject
        .switchMap(
          (_) => sourceStream.scan(
            (accumulated, value, index) {
              var accumulatedVal = accumulated as int;
              return accumulatedVal + value['population'];
            },
            0,
          ),
        )
        .listen(
          (event) => print(event),
        );

    sourceSubject.add(null);
  }

  @override
  void dispose() {
    super.dispose();

    this.sourceSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RX Scan Operator',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: Container(
          child: Center(
            child: Text(
              'Show in console',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
