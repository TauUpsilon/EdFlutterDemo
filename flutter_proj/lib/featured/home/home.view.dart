import 'package:flutter/material.dart';

import 'package:flutter_proj/featured/home/home.page.dart';
import 'package:flutter_proj/featured/home/widgets/home_nav/home_nav.widget.dart';
import 'package:flutter_proj/shared/core/base_view.core.dart';

class HomePageView extends BaseView<HomePageState> {
  const HomePageView({
    required Key key,
    required HomePageState state,
  }) : super(state: state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Text(state.title),
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
        child: Center(
          child: state.pageBodies.elementAt(state.selectedNavBarIdx),
        ),
      ),
      bottomNavigationBar: HomeNavWidget(
        key: UniqueKey(),
        index: state.selectedNavBarIdx,
        onNavBarTapped: (index) => state.onNavBarTapped(index),
      ),
    );
  }
}
