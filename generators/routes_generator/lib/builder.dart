import 'package:build/build.dart';
import 'package:routes_generator/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder routesBuilder(BuilderOptions options) => SharedPartBuilder(
      [RoutesGenerator()],
      'route',
    );
