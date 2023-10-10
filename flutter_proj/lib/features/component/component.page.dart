import 'package:flutter/material.dart';
import 'package:flutter_proj/app/app.widget.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';
import 'package:flutter_proj/shares/widgets/calculator.widget.dart';
import 'package:flutter_proj/shares/widgets/header.widget.dart';

class ComponentPage extends StatefulWidget with AlphaBase {
  ComponentPage({super.key});

  @override
  State<ComponentPage> createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
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
