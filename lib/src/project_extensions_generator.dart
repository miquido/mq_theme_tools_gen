import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:extensions_builder/project_extensions.dart';
import 'package:source_gen/source_gen.dart';

class ProjectExtensionsGenerator extends GeneratorForAnnotation<ProjectExtensions> {
  @override
  FutureOr<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final className = element.name!;
    final mixinNameGen = '_${className}Mixin';
    final steps = annotation.read('steps').listValue.map((e) => e.toIntValue()).whereType<int>().toList();

    return Generator(mixinNameGen, steps).code();
  }
}

class Generator {
  Generator(this.mixinName, this.steps);

  final String mixinName;
  final List<int> steps;

  String _propertyGen(int step) => 'p$step';

  String _mixinGenerator() => Mixin(
        (b) => b
          ..name = mixinName
          ..fields.addAll(
            steps.map(
              (step) => Field(
                (b) => b
                  ..name = _propertyGen(step)
                  ..modifier = FieldModifier.constant
                  ..static = true
                  ..type = refer('double')
                  ..assignment = Code(step.toString()),
              ),
            ),
          ),
      ).accept(DartEmitter()).toString();

  String _fieldGenerator({required String fieldName, required int step, required String className, String? param}) {
    final namedArguments = <String, Expression>{};
    final positionalArguments = <Expression>[];

    final paramExpr = TypeReference(
      (b) => b
        ..symbol = '$mixinName.${_propertyGen(step)}'
        ..url = 'package:flutter/material.dart',
    );

    if (param != null) {
      namedArguments[param] = paramExpr;
    } else {
      positionalArguments.add(paramExpr);
    }

    final expr = InvokeExpression.newOf(
      TypeReference(
        (b) => b
          ..symbol = className
          ..url = 'package:flutter/material.dart',
      ),
      positionalArguments,
      namedArguments,
    );

    return Field(
      (b) => b
        ..name = '$fieldName$step'
        ..modifier = FieldModifier.constant
        ..assignment = Code(expr.accept(DartEmitter()).toString()),
    ).accept(DartEmitter()).toString();
  }

  List<String> _hGapFieldsGenerator() => [
        '/// Constant horizontal gaps',
        ...steps.map((step) => _fieldGenerator(fieldName: 'hGap', step: step, className: 'SizedBox', param: 'width')),
      ];

  List<String> _vGapFieldsGenerator() => [
        '/// Constant vertical gaps',
        ...steps.map((step) => _fieldGenerator(fieldName: 'vGap', step: step, className: 'SizedBox', param: 'height')),
      ];

  List<String> _vPaddingGenerator() => [
        '// Vertical Paddings',
        ...steps.map(
          (step) => _fieldGenerator(
            fieldName: 'vPadding',
            step: step,
            className: 'EdgeInsets.symmetric',
            param: 'vertical',
          ),
        ),
      ];

  List<String> _hPaddingGenerator() => [
        '// Horizontal Paddings',
        ...steps.map(
          (step) => _fieldGenerator(
            fieldName: 'hPadding',
            step: step,
            className: 'EdgeInsets.symmetric',
            param: 'horizontal',
          ),
        ),
      ];

  List<String> _allPaddingGenerator() => [
        '// All Paddings',
        ...steps.map((step) => _fieldGenerator(fieldName: 'allPadding', step: step, className: 'EdgeInsets.all')),
      ];

  String code() => [
        _mixinGenerator(),
        ..._hGapFieldsGenerator(),
        ..._vGapFieldsGenerator(),
        ..._vPaddingGenerator(),
        ..._hPaddingGenerator(),
        ..._allPaddingGenerator(),
      ].join('\n\n');
}
