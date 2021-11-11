import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/ubike.service.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/widgets/bike_stop.widget.dart';
import 'package:project/main.locator.dart';
import 'package:project/shared/bases/base_widget.state.dart';
import 'package:project/shared/models/api_data.model.dart';
import 'package:project/shared/models/data_room.model.dart';
import 'package:project/shared/models/ubike_stop.model.dart';

class UBikeListPageModel {
  final Stream<ApiData<UBikeStop>>? getUBikeStops;

  UBikeListPageModel({
    this.getUBikeStops,
  });
}

class UBikeListPage extends StatefulWidget {
  @override
  _UBikeListPageState createState() => _UBikeListPageState();
}

class _UBikeListPageState extends BaseWidgetState<UBikeListPage> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'UBike',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: StreamBuilder<UBikeListPageModel>(
        stream: Stream<UBikeListPageModel>.value(
          UBikeListPageModel(
            getUBikeStops: locator.get<UBikeService>().getUBikeStops('size=10'),
          ),
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<UBikeListPageModel> snapshot,
        ) {
          if (snapshot.hasData) {
            return StreamBuilder<ApiData<UBikeStop>>(
              stream: snapshot.data!.getUBikeStops,
              builder: (
                BuildContext context,
                AsyncSnapshot<ApiData<UBikeStop>> snapshot,
              ) {
                if (snapshot.hasData) {
                  var res = snapshot.data;

                  switch (res!.STATUS) {
                    case ResponseStatus.LOADING:
                      return Container(
                        child: Center(
                          child: Text('Loading'),
                        ),
                      );

                    case ResponseStatus.SUCCESS:
                      var dataSet = res.COLLECTION!.DATA!;

                      return GestureDetector(
                        onTap: () => FocusScope.of(context).requestFocus(
                          new FocusNode(),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.15, 0.35, 1],
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).scaffoldBackgroundColor,
                                Theme.of(context).scaffoldBackgroundColor,
                              ],
                            ),
                          ),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: SafeArea(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset('assets/images/logo.png'),
                                        // Row(
                                        //   children: [
                                        //     IconButton(
                                        //       onPressed: () => {
                                        //         print('icon Clicked'),
                                        //         MyApp.setTheme.add(true)
                                        //       },
                                        //       icon: Icon(Icons.light_mode),
                                        //     ),
                                        //     IconButton(
                                        //       onPressed: () => {
                                        //         print('icon Clicked'),
                                        //         MyApp.setTheme.add(false)
                                        //       },
                                        //       icon: Icon(Icons.dark_mode),
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: CupertinoSearchTextField(
                                      controller: _textController,
                                      backgroundColor:
                                          Theme.of(context).primaryColorDark,
                                      placeholder: '搜尋',
                                      padding: EdgeInsets.all(6),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      physics: BouncingScrollPhysics(),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 24),
                                      children: dataSet
                                          .map(
                                            (data) => BikeStopWidget(
                                              stopName: data.SNA,
                                              updateTimeStr: data.MDAY,
                                              availableBikes:
                                                  int.parse(data.SBI!),
                                              availableReturnPlace:
                                                  int.parse(data.BEMP!),
                                              location: data.SAREA,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                    default:
                      return Container(
                        child: Center(
                          child: Text('Default'),
                        ),
                      );
                  }
                }

                return Container(
                  child: Center(
                    child: Text('loading'),
                  ),
                );
              },
            );
          }

          return Container(
            child: Center(
              child: Text('loading'),
            ),
          );
        },
      ),
    );
  }
}
