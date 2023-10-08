import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha.core.dart';
import 'package:flutter_proj/features/home/widgets/home_nav.widget.dart';
import 'package:flutter_proj/features/restful/restful_list.page.dart';
import 'package:flutter_proj/shares/widgets/calculator.widget.dart';

class HomePage extends StatefulWidget with AlphaCore {
  HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String title = 'My Flutter';

  int selectedNavBarIdx = 0;

  PreferredSizeWidget appBar() => PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Text(title),
          backgroundColor: Colors.black,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
              MediaQuery.of(context).size.height,
              200.0,
            )),
          ),
        ),
      );

  Widget body() => SafeArea(
        child: Center(
          child: pageBodies().elementAt(selectedNavBarIdx),
        ),
      );

  List<Widget> pageBodies() => <Widget>[
        RestfulListPage(key: UniqueKey()),
        CalculatorWidget(key: UniqueKey()),
      ];

  Widget bottomNavBar() => HomeNavWidget(
        key: UniqueKey(),
        index: selectedNavBarIdx,
        onNavBarTapped: (index) => setState(() {
          selectedNavBarIdx = index;
        }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
