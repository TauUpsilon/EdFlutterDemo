import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RXCombineLatestStreamPage extends StatefulWidget {
  @override
  _RXCombineLatestStreamPageState createState() =>
      _RXCombineLatestStreamPageState();
}

class _RXCombineLatestStreamPageState
    extends BaseWidgetState<RXCombineLatestStreamPage> {
  static const figureSource = {'name': 'Arthur'};
  static const carrySource = {'name': 'Excalibur'};

  final figureStream = new Stream.value(figureSource).asBroadcastStream();
  final carryStream = new Stream.value(carrySource).asBroadcastStream();
  final mergeSubject = new BehaviorSubject();

  String mergedStr;

  @override
  void initState() {
    super.initState();

    this
        .mergeSubject
        .switchMap((value) => CombineLatestStream.combine2(
                this.figureStream, this.carryStream, (figure, carry) {
              return '${figure['name']} - ${carry['name']}';
            }))
        .listen((res) {
      this.setState(() {
        this.mergedStr = res;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    this.mergeSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RX Merge Stream',
          style: TextStyle(fontSize: 13),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [0, 1]
                      .map((
                        e,
                      ) =>
                          Column(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.50 -
                                        12.5,
                                color: Colors.blueGrey[900],
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    e == 0
                                        ? '${figureSource['name']}'
                                        : '${carrySource['name']}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList()),
              SizedBox(
                height: 80,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [0]
                      .map((e) => TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(20),
                              backgroundColor: Colors.blueGrey[200],
                            ),
                            child: Text(
                              'Conbine',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black45),
                            ),
                            onPressed: () {
                              this.mergeSubject.add(null);
                            },
                          ))
                      .toList()),
              SizedBox(
                height: 80,
              ),
              this.mergedStr != null
                  ? Container(
                      width: MediaQuery.of(context).size.width * 1 - 10,
                      color: Colors.blueGrey[900],
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: Text(
                        '${this.mergedStr}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    )
                  : Container()
            ],
          )),
    );
  }
}
