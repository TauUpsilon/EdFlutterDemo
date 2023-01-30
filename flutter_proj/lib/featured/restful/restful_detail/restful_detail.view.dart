import 'package:flutter/material.dart';

import 'package:flutter_proj/featured/restful/restful_detail/restful_detail.page.dart';
import 'package:flutter_proj/core/base_view.core.dart';

class RestfulDetailPageView extends BaseView<RestfulDetailPageState> {
  const RestfulDetailPageView({
    required Key key,
    required RestfulDetailPageState state,
  }) : super(state: state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text('匯率明細'),
          backgroundColor: Colors.black,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
              MediaQuery.of(context).size.height,
              200.0,
            )),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: ListView.builder(
            itemCount: state.widget.fxRate.toJson().length,
            itemBuilder: (context, index) {
              final fxRateMap = state.widget.fxRate.toJson();
              final key = fxRateMap.keys.toList()[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.getFxRateKeyName(key),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      state.getFxRateStrValue(fxRateMap[key]),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
