import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_proj/api/models/mbm081018/mbm081018.model.dart';
import 'package:flutter_proj/api/services/mbm081018.service.dart';
import 'package:flutter_proj/featured/restful/restful_list/restful_list.view.dart';

class RestfulListPage extends StatefulWidget {
  const RestfulListPage({required Key key}) : super(key: key);

  @override
  RestfulListPageState createState() => RestfulListPageState();
}

class RestfulListPageState extends State<RestfulListPage> {
  late MBM081018Service fxRateService;

  late Future<MBM081018Model> fxRate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    fxRateService = Provider.of<MBM081018Service>(context);
    fxRate = fxRateService.getFxRate('');
  }

  @override
  Widget build(BuildContext context) => RestfulListPageView(
        key: UniqueKey(),
        state: this,
      );

  void onUpdateFxRate() {
    setState(() {
      fxRate = fxRateService.getFxRate('');
    });
  }

  void onFxRateItemTap(MBM081018FxRate item) {
    Navigator.of(context).pushNamed('/restful/detail', arguments: item);
  }
}
