import 'package:flutter/material.dart';
import 'package:flutter_proj/core/alpha_base.mixin.dart';

class HeaderBarWidget extends StatelessWidget with AlphaBase {
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
      automaticallyImplyLeading: false,
      leading: Navigator.of(context).canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
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
