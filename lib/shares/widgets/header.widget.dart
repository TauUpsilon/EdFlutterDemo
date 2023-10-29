import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';

class HeaderBarWidget extends StatelessWidget with AlphaBase {
  final String title;

  HeaderBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        elevation: 20,
        leading: context.router.canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.router.pop(),
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              MediaQuery.of(context).size.height,
              200,
            ),
          ),
        ),
      );
}
