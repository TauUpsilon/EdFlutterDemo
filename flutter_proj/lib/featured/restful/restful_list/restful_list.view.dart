import 'package:flutter/material.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';

import 'package:flutter_proj/featured/restful/restful_list/restful_list.page.dart';
import 'package:flutter_proj/shared/core/base_view.core.dart';

class RestfulListPageView extends BaseView<RestfulListPageState> {
  const RestfulListPageView({
    required Key key,
    required RestfulListPageState state,
  }) : super(state: state, key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MBM081018Model>(
      future: state.fxRate,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();

          default:
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  // Handle Error
                  snapshot.hasError
                      ? const Text('Has Error')

                      // Handle Data
                      : snapshot.hasData

                          // Has Data
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data!.fxRate.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => state.onFxRateItemTap(
                                      snapshot.data!.fxRate[index],
                                    ),
                                    child: Card(
                                      key: UniqueKey(),
                                      elevation: 8.0,
                                      color: Colors.black,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 0.0,
                                        vertical: 6.0,
                                      ),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 10.0,
                                        ),

                                        // Tile leading
                                        leading: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            10.0,
                                            14.0,
                                            10.0,
                                          ),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                width: 2.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.currency_exchange,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),

                                        // Tile middle
                                        title: Text(
                                          snapshot.data!.fxRate[index].ccyName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),

                                        // Tile tail
                                        trailing: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )

                          // Has no Data
                          : Image.asset(
                              'assets/images/Group 102.png',
                              width: MediaQuery.of(context).size.width * 0.7,
                              fit: BoxFit.fitWidth,
                            ),

                  // Gap
                  const SizedBox(height: 20),

                  // Refresh button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      primary: Colors.black,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Refresh',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: () => state.onUpdateFxRate(),
                  )
                ],
              ),
            );
        }
      },
    );
  }
}
