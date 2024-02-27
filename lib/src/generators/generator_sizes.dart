import 'package:code_builder/code_builder.dart';
import 'package:extensions_builder/src/generators/generator_base.dart';

class GeneratorSizes extends GeneratorBase {
  GeneratorSizes(this._mixinClass, this._steps);

  final String _mixinClass;
  final Set<int> _steps;

  String _propertyGen(int step) => 'p$step';

  String _mixinGenerator() => Mixin(
        (mixin) => mixin
          ..name = _mixinClass
          ..fields.addAll(
            _steps.map(
              (step) => Field(
                (field) => field
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
      (typeRef) => typeRef
        ..symbol = '$_mixinClass.${_propertyGen(step)}'
        ..url = 'package:flutter/material.dart',
    );

    if (param != null) {
      namedArguments[param] = paramExpr;
    } else {
      positionalArguments.add(paramExpr);
    }

    final expr = InvokeExpression.newOf(
      TypeReference(
        (typeRef) => typeRef
          ..symbol = className
          ..url = 'package:flutter/material.dart',
      ),
      positionalArguments,
      namedArguments,
    );

    return Field(
      (field) => field
        ..name = '$fieldName$step'
        ..modifier = FieldModifier.constant
        ..assignment = Code(expr.accept(DartEmitter()).toString()),
    ).accept(DartEmitter()).toString();
  }

  List<String> _hGapFieldsGenerator() => [
        '/// Constant horizontal gaps',
        ..._steps.map((step) => _fieldGenerator(fieldName: 'hGap', step: step, className: 'SizedBox', param: 'width')),
      ];

  List<String> _vGapFieldsGenerator() => [
        '/// Constant vertical gaps',
        ..._steps.map((step) => _fieldGenerator(fieldName: 'vGap', step: step, className: 'SizedBox', param: 'height')),
      ];

  List<String> _vPaddingGenerator() => [
        '// Vertical Paddings',
        ..._steps.map(
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
        ..._steps.map(
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
        ..._steps.map((step) => _fieldGenerator(fieldName: 'allPadding', step: step, className: 'EdgeInsets.all')),
      ];

  @override
  String code() => [
        _mixinGenerator(),
        ..._hGapFieldsGenerator(),
        ..._vGapFieldsGenerator(),
        ..._vPaddingGenerator(),
        ..._hPaddingGenerator(),
        ..._allPaddingGenerator(),
      ].join('\n\n');
}
