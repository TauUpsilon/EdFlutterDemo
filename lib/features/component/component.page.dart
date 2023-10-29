import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/shares/widgets/calculator.widget.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';

@RoutePage<ComponentPage>()
class ComponentPage extends StatefulWidget {
  ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> with AppConfig {
  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: HeaderBarWidget(title: appTitle),
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
