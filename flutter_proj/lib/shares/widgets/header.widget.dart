import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha.core.dart';

class HeaderBarWidget extends StatelessWidget with AlphaCore {
  final String title;

  HeaderBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(
            MediaQuery.of(context).size.height,
            200.0,
          ),
        ),
      ),
    );
  }
}
