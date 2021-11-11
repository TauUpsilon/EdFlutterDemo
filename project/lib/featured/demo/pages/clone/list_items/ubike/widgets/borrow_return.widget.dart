import 'package:flutter/material.dart';
import 'package:project/main.theme.dart';

class BorrowReturnWidget extends StatelessWidget {
  final String title;
  final int? number;

  const BorrowReturnWidget(this.title, this.number, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            number?.toString() ?? '',
            style: TextStyle(
              fontSize: 24,
              color: (number ?? 0) >= 5
                  ? number! >= 10
                      ? kGreenColor
                      : kOrangeColor
                  : kRedColor,
            ),
          ),
        ],
      ),
    );
  }
}
