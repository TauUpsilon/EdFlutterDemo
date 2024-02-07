import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/widgets/calculator.widget.dart';
import 'package:eyr/shared/widgets/digit_keyboard/digit_keyboard_cubit.dart';
import 'package:eyr/shared/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:page_route_annotation/page_route.annotation.dart';

part 'component.page.g.dart';

@RouteParamGenerable()
class ComponentPage extends StatefulWidget {
  const ComponentPage({super.key});

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
      body: Padding(
        padding: EdgeInsets.zero,
        child: DigitKeyboard(
          onValueChanged: (value) {
            // print('Change: $value');
          },
          onSubmitted: (value) {
            // print('Submit: $value');
          },
        ),
      ),
    );
  }
}
