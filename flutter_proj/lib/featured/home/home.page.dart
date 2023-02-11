import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj/api/services/mbm081018.service.dart';
import 'package:flutter_proj/featured/restful/restful_list.page.dart';
import 'package:flutter_proj/shared/widgets/calculator.widget.dart';
import 'package:flutter_proj/featured/home/widgets/home_nav.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({required Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String title = 'My Flutter';

  int selectedNavBarIdx = 0;

  PreferredSizeWidget get appBar => PreferredSize(
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

  Widget get body => SafeArea(
        child: Center(
          child: pageBodies.elementAt(selectedNavBarIdx),
        ),
      );

  List<Widget> get pageBodies => <Widget>[
        MultiProvider(
          providers: [
            Provider(create: (_) => MBM081018Service()),
          ],
          child: RestfulListPage(key: UniqueKey()),
        ),
        CalculatorWidget(key: UniqueKey()),
      ];

  Widget get bottomNavBar => HomeNavWidget(
        key: UniqueKey(),
        index: selectedNavBarIdx,
        onNavBarTapped: (index) => setState(() {
          selectedNavBarIdx = index;
        }),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavBar,
      );
}
