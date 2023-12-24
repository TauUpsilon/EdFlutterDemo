import 'dart:convert';

import 'package:eyr/shares/mixins/common_functionable.mixin.dart';
import 'package:eyr/states/cubit/mask/mask_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'app.config.dart';
part 'package:eyr/shares/utils/string.util.dart';

class App extends StatelessWidget with CommonFunctionable {
  App({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: maskCubit),
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
          ),
          BlocBuilder<MaskCubit, MaskState>(
            builder: (context, state) {
              return Visibility(
                visible: state.clients.isNotEmpty,
                child: Container(
                  color: Color.fromARGB(166, 0, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
