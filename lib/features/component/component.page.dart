import 'package:flutter/material.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/shares/widgets/calculator.widget.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key});

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
