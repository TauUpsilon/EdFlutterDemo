import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => {
                                print('icon Clicked'),
                                // MyApp.setTheme.add(true)
                              },
                              icon: Icon(Icons.light_mode),
                            ),
                            IconButton(
                              onPressed: () => {
                                print('icon Clicked'),
                                // MyApp.setTheme.add(false)
                              },
                              icon: Icon(Icons.dark_mode),
                            )
                          ],
                        ),
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
                        BikeStopCard('大鵬華城', '2021/09/25 15:59:16', 38, 8),
                        BikeStopCard('汐止火車站', '2021/09/25 15:59:16', 56, 21),
                        BikeStopCard('汐止區公所', '2021/09/25 15:59:16', 46, 3),
                        BikeStopCard('國泰綜合醫院', '2021/09/25 15:59:16', 56, 24),
                        BikeStopCard('裕隆公園', '2021/09/25 15:59:16', 10, 8),
                        BikeStopCard('捷運大坪林站', '2021/09/25 15:59:16', 56, 2),
                        BikeStopCard('大鵬華城', '2021/09/25 15:59:16', 2, 38),
                        BikeStopCard('大鵬華城', '2021/09/25 15:59:16', 7, 22),
                        BikeStopCard('大鵬華城', '2021/09/25 15:59:16', 33, 26),
                        BikeStopCard('大鵬華城', '2021/09/25 15:59:16', 38, 2),
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

class BikeStopCard extends StatelessWidget {
  final String? stopName;
  final String? updateTimeStr;
  final int? canBuy;
  final int? canGive;

  const BikeStopCard(
      this.stopName, this.updateTimeStr, this.canBuy, this.canGive,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //         DetailPage(stopName, updateTimeStr, canBuy, canGive),
        //   ),
        // ),
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          color: Theme.of(context).primaryColorDark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stopName ?? '無',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '更新時間：$updateTimeStr',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
                BuyGiveComponent('可借', canBuy),
                BuyGiveComponent('可還', canGive),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuyGiveComponent extends StatelessWidget {
  final String title;
  final int? number;

  const BuyGiveComponent(this.title, this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            number?.toString() ?? '',
            style: TextStyle(
              fontSize: 24,
              color: (number ?? 0) >= 5
                  ? number! >= 10
                      ? kGreenColor
                      : kOrangeColor
                  : kRedColor,
            ),
          ),
        ],
      ),
    );
  }
}

const Color kBlackColor = Color(0xff575757);

const Color kGreenColor = Color(0xff8AC675);
const Color kOrangeColor = Color(0xffFF9500);
const Color kRedColor = Color(0xffFF3B30);
