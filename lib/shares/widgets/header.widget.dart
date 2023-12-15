import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:flutter/material.dart';

class HeaderBarWidget extends StatelessWidget with CommonFunctionable {
  final String title;

  HeaderBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(title),
        backgroundColor: Colors.black,
        elevation: 20,
        leading: router.canPop()
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => router.popTop(),
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
