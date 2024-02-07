library page_route_generator;

import 'package:build/build.dart';
import 'package:page_route_generator/src/route_param.generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateRouteParam(BuilderOptions options) => SharedPartBuilder(
      [RouteParamGenerator()],
      'route_param_generator',
    );
