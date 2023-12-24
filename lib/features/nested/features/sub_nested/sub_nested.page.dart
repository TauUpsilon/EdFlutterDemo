import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';

class SubNestedPage extends StatelessWidget with CommonFunctionable {
  SubNestedPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HeaderBarWidget(title: 'Sub Nested Home'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: DragTarget<String>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Drop here',
                        ),
                      ),
                    ),
                  );
                },
                onAccept: (data) {
                  debugPrint('hi $data');
                },
                onWillAccept: (data) {
                  return true;
                },
                onLeave: (data) {},
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 5,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(20, (int i) {})
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Draggable<String>(
                            data: 'red',
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Icon(
                                  Icons.table_restaurant_rounded,
                                  size: 50,
                                ),
                              ),
                            ),
                            feedback: Container(
                              height: 60,
                              width: 60,
                              child: Center(
                                child: Icon(
                                  Icons.table_restaurant_rounded,
                                  size: 60,
                                ),
                              ),
                            ),
                            childWhenDragging: Container(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Icon(
                                  Icons.table_restaurant_rounded,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
