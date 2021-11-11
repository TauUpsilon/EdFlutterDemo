import 'package:flutter/material.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/ubike_detail.page.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/widgets/borrow_return.widget.dart';

class BikeStopWidget extends StatelessWidget {
  final String? stopName;
  final String? updateTimeStr;
  final int? canBuy;
  final int? canGive;

  const BikeStopWidget(
      this.stopName, this.updateTimeStr, this.canBuy, this.canGive,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                UBikeDetialPage(stopName, updateTimeStr, canBuy, canGive),
          ),
        ),
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          color: Theme.of(context).primaryColorDark,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stopName ?? '無',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '更新時間：$updateTimeStr',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
                BorrowReturnWidget('可借', canBuy),
                BorrowReturnWidget('可還', canGive),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
