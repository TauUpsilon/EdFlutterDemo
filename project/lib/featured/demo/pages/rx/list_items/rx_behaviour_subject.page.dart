import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:rxdart/rxdart.dart';

class RXBehaviourSubjectPage extends StatefulWidget {
  @override
  _RXBehaviourSubjectPageState createState() => _RXBehaviourSubjectPageState();
}

class _RXBehaviourSubjectPageState
    extends BaseWidgetState<RXBehaviourSubjectPage> {
  static const sources = {
    'king': {'name': 'king', 'said': 'Protect the people'},
    'queen': {'name': 'queen', 'said': 'Love the people'},
    'knight': {'name': 'knight', 'said': 'Charge...'},
  };

  var sourceSubject = new BehaviorSubject<Map<String, String>>.seeded(
    sources['king']!,
  );

  var source = new Map<String, String>.from(
    sources['king']!,
  );

  @override
  void initState() {
    super.initState();

    this.sourceSubject.listen(
          (value) => setState(
            () {
              this.source = value;
            },
          ),
        );
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
          'RX Behaviour Subject',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.builder(
                  itemCount: sources.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    width: 105,
                    margin: EdgeInsets.all(10),
                    color: Colors.blueGrey[900],
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        // primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                      onPressed: () {
                        sourceSubject.add(
                          sources[sources.keys.elementAt(index)]!,
                        );
                      },
                      child: Text(
                        '${sources[sources.keys.elementAt(index)]!['name']!.toUpperCase()}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                margin: EdgeInsets.all(10),
                color: Colors.black45,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${this.source['name']!.toUpperCase()}',
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${this.source['said']}',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
