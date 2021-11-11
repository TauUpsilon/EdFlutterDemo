import 'package:flutter/material.dart';
import 'package:project/main.theme.dart';

class UBikeDetialPage extends StatelessWidget {
  final String? stopName;
  final String? updateTimeStr;
  final String? location;
  final int? availableBikes;
  final int? availableReturnPlace;

  const UBikeDetialPage({
    Key? key,
    this.stopName,
    this.updateTimeStr,
    this.location,
    this.availableBikes,
    this.availableReturnPlace,
  }) : super(key: key);

  Color? getcorrespondColor(int? number) {
    Color color = (number ?? 0) >= 5
        ? number! >= 10
            ? kGreenColor
            : kOrangeColor
        : kRedColor;

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        shadowColor: Color(0x40BCBABA),
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 40,
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                stopName!,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(16),
              //     side: BorderSide(color: Color(0xffE8E8E8))),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE8E8E8)),
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).canvasColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 26.0, horizontal: 20),
                child: Column(
                  children: [
                    InfoItem(
                      '剩餘車輛',
                      availableBikes.toString(),
                      infoColor: getcorrespondColor(availableBikes),
                    ),
                    InfoItem(
                      '可還空位數',
                      availableReturnPlace.toString(),
                      infoColor: getcorrespondColor(availableReturnPlace),
                    ),
                    InfoItem(
                      '總車位',
                      (availableBikes! + availableReturnPlace!).toString(),
                      infoColor: Theme.of(context).primaryColorLight,
                    ),
                    InfoItem(
                      '區域',
                      location!.toString(),
                      infoColor: Theme.of(context).hintColor,
                    ),
                    InfoItem(
                      '地址',
                      '新北市新店區中正路700巷3號',
                      infoColor: Theme.of(context).hintColor,
                    ),
                    InfoItem(
                      '更新時間',
                      '2021/09/25 15:59:16',
                      infoColor: Theme.of(context).hintColor,
                      showDivider: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String info;
  final bool showDivider;
  final Color? infoColor;

  const InfoItem(
    this.title,
    this.info, {
    this.infoColor = const Color(0xff959292),
    this.showDivider = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  info,
                  style: TextStyle(color: infoColor),
                ),
              ],
            ),
          ),
          Visibility(
            visible: showDivider,
            child: Divider(
              height: 20,
              thickness: 1,
              color: Color(0xffE8E8E8),
            ),
          )
        ],
      ),
    );
  }
}
