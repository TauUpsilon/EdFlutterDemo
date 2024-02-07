import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeaderBarWidget extends StatelessWidget with CommonFuncable {
  final String title;

  HeaderBarWidget({
    required this.title,
    super.key,
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
                icon: const Icon(Icons.arrow_back),
                onPressed: () => router.pop(),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
