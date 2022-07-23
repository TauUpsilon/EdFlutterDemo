import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_proj/api/services/mbm081018.service.dart';

import 'package:flutter_proj/featured/home/home.view.dart';
import 'package:flutter_proj/featured/restful/restful_list/restful_list.page.dart';
import 'package:flutter_proj/shared/widgets/calculator/calculator.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({required Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String title = '台新 Flutter';

  late List<Widget> pageBodies = <Widget>[
    CalculatorWidget(key: UniqueKey()),
    MultiProvider(
      providers: [
        Provider(create: (_) => MBM081018Service()),
      ],
      child: RestfulListPage(key: UniqueKey()),
    ),
  ];

  int selectedNavBarIdx = 0;

  void onNavBarTapped(int index) {
    setState(() {
      selectedNavBarIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) => HomePageView(
        key: UniqueKey(),
        state: this,
      );
}
