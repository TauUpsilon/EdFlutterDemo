// ignore_for_file: implementation_imports, depend_on_referenced_packages

library json_paramable_generator;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:json_paramable_annotation/json_paramable_annotation.dart';
import 'package:source_gen/source_gen.dart';

part 'src/generators.dart';
part 'src/visitors.dart';

Builder generateJsonParam(BuilderOptions options) => SharedPartBuilder(
      [JsonParamableGenerator()],
      'json_paramable_generator',
    );
