import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/ubike_detail.page.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/widgets/bike_stop.widget.dart';
import 'package:project/main.theme.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class UBikeListPage extends StatefulWidget {
  @override
  _UBikeListPageState createState() => _UBikeListPageState();
}

class _UBikeListPageState extends BaseWidgetState<UBikeListPage> {
  static const tabList = [
    {
      'name': 'Bahaviour Subject',
      'url': '/demo/rx/behaviour_subject',
    },
  ];

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
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
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      backgroundColor: Theme.of(context).primaryColorDark,
                      placeholder: '搜尋',
                      padding: EdgeInsets.all(6),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        BikeStopWidget('大鵬華城', '2021/09/25 15:59:16', 38, 8),
                        BikeStopWidget('汐止火車站', '2021/09/25 15:59:16', 56, 21),
                        BikeStopWidget('汐止區公所', '2021/09/25 15:59:16', 46, 3),
                        BikeStopWidget('國泰綜合醫院', '2021/09/25 15:59:16', 56, 24),
                        BikeStopWidget('裕隆公園', '2021/09/25 15:59:16', 10, 8),
                        BikeStopWidget('捷運大坪林站', '2021/09/25 15:59:16', 56, 2),
                        BikeStopWidget('大鵬華城', '2021/09/25 15:59:16', 2, 38),
                        BikeStopWidget('大鵬華城', '2021/09/25 15:59:16', 7, 22),
                        BikeStopWidget('大鵬華城', '2021/09/25 15:59:16', 33, 26),
                        BikeStopWidget('大鵬華城', '2021/09/25 15:59:16', 38, 2),
                        SizedBox(height: 20)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
