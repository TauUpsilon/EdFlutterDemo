import 'package:eyr/app/app.widget.dart';
import 'package:eyr/shares/widgets/calculator.widget.dart';
import 'package:eyr/shares/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'component.page.g.dart';

@RouteParamGenerable()
class ComponentPage extends StatefulWidget {
  ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: HeaderBarWidget(title: AppConfig.appTitle),
    );
  }

  Widget body() {
    return SafeArea(
      child: Center(
        child: CalculatorWidget(key: UniqueKey()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }
}
