import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:extensions_builder/project_extensions.dart';
import 'package:extensions_builder/src/generators/generator_colors.dart';
import 'package:extensions_builder/src/generators/generator_sizes.dart';
import 'package:source_gen/source_gen.dart';

class ProjectExtensionsGenerator extends GeneratorForAnnotation<ProjectExtensions> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final className = element.name!;
    final mixinNameGen = '_${className}Mixin';
    final steps = annotation.read('steps').setValue.map((e) => e.toIntValue()).whereType<int>().toSet();

    final colorFields =
        element.children.whereType<FieldElement>().where((element) => element.type.toString() == 'Color').toList();

    return [GeneratorSizes(mixinNameGen, steps).code(),GeneratorColors(colorFields,className).code()].join('\n');
  }
}
