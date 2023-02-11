import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import 'package:flutter_proj/featured/restful/store/restful.action.dart';
import 'package:flutter_proj/featured/restful/store/restful.middleware.dart';
import 'package:flutter_proj/featured/restful/store/restful.reducer.dart';
import 'package:flutter_proj/featured/restful/store/restful.state.dart';
import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';

class RestfulListPage extends StatefulWidget {
  const RestfulListPage({required Key key}) : super(key: key);

  @override
  RestfulListPageState createState() => RestfulListPageState();
}

class RestfulListPageState extends State<RestfulListPage> {
  final store = Store(
    restfulReducer,
    initialState: RestfulState.initialState(),
    middleware: [restfulMiddleware],
  );

  @override
  void initState() {
    super.initState();

    store.dispatch(GetPartOne());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Expanded fxRateListView(List<MBM081018FxRate> fxRate) => Expanded(
        child: ListView.builder(
          itemCount: fxRate.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              '/restful/detail',
              arguments: fxRate[index],
            ),
            child: fxRateListViewItem(fxRate[index]),
          ),
        ),
      );

  Widget fxRateListViewItem(MBM081018FxRate fxRate) => Card(
        key: UniqueKey(),
        elevation: 8.0,
        color: Colors.black,
        margin: const EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 6.0,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),

          // Tile leading
          leading: fxRateListViewTileLead(),

          // Tile middle
          title: fxRateListViewTileMiddle(fxRate.ccyName),

          // Tile tail
          trailing: fxRateListViewTileTail(),
        ),
      );

  Widget fxRateListViewTileLead() => Container(
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
      );

  Widget fxRateListViewTileMiddle(String text) => Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      );

  Widget fxRateListViewTileTail() => const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      );

  ElevatedButton refreshBtn() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          // primary: Colors.black,
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
        onPressed: () => store.dispatch(GetPartOne()),
      );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<RestfulState, MBM081018Model>(
        converter: (store) => store.state.mbm081018model!,
        builder: (_, vm) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              fxRateListView(vm.fxRate),

              const SizedBox(height: 20), // Gap

              refreshBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
