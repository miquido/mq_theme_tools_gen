import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';
import 'package:extensions_builder/src/generators/generator_base.dart';

class GeneratorColors extends GeneratorBase {
  GeneratorColors(this._colorFields, this._annotationClass);

  final List<FieldElement> _colorFields;

  final String _annotationClass;

  final _className = 'AppColorsTheme';

  Method get _copyWithMethod => Method(
        (method) => method
          ..name = 'copyWith'
          ..returns = refer(_className)
          ..annotations.add(refer('override'))
          ..optionalParameters.addAll(
            _colorFields.map(
              (field) => Parameter(
                (b) => b
                  ..name = field.name
                  ..named = true
                  ..required = false
                  ..type = refer('Color?'),
              ),
            ),
          )
          ..body = _copyWithBody.code,
      );

  InvokeExpression get _copyWithBody => InvokeExpression.newOf(
        TypeReference(
          (typeRef) => typeRef
            ..symbol = _className
            ..url = 'package:flutter/material.dart',
        ),
        [],
        Map.fromEntries(
          _colorFields.map(
            (field) => MapEntry(
              field.name,
              refer('${field.name} ?? this.${field.name}'),
            ),
          ),
        ),
      );

  Method get _lerpMethod => Method(
        (method) => method
          ..name = 'lerp'
          ..returns = refer('ThemeExtension<$_className>')
          ..annotations.add(refer('override'))
          ..requiredParameters.addAll([
            Parameter(
              (param) => param
                ..name = 'other'
                ..covariant = true
                ..type = refer('ThemeExtension<$_className>?'),
            ),
            Parameter(
              (param) => param
                ..name = 't'
                ..type = refer('double'),
            ),
          ])
          ..body = Code(
            'if (other is! $_className) { return this; } return ${_lerpBody.accept(DartEmitter())};',
          ),
      );

  InvokeExpression _lerpBodyClass(FieldElement field) => InvokeExpression.newOf(
        TypeReference(
          (typeRef) => typeRef
            ..symbol = 'Color.lerp'
            ..isNullable = false
            ..url = 'package:flutter/material.dart',
        ),
        [
          refer(field.name),
          refer('other.${field.name}'),
          refer('t'),
        ],
      );

  InvokeExpression get _lerpBody => InvokeExpression.newOf(
        TypeReference(
          (typeRef) => typeRef
            ..symbol = _className
            ..types
            ..url = 'package:flutter/material.dart',
        ),
        [],
        Map.fromEntries(
          _colorFields.map(
            (field) => MapEntry(
              field.name,
              refer('${_lerpBodyClass(field).accept(DartEmitter())}!'),
            ),
          ),
        ),
      );

  Constructor get _constructor => Constructor((constructor) => constructor
    ..optionalParameters.addAll(_colorFields.map(
      (field) => Parameter((param) => param
        ..name = field.name
        ..named = true
        ..toThis = true
        ..required = true,),
    ),),);

  String _mixinGenerator() => Class(
        (c) => c
          ..name = _className
          ..extend = refer('ThemeExtension<$_className>')
          ..constructors.add(_constructor)
          ..fields.addAll(
            _colorFields.map(
              (field) => Field((field) => field
                ..name = field.name
                ..modifier = FieldModifier.final$
                ..type = refer('Color'),),
            ),
          )
          ..methods.addAll(
            [_copyWithMethod, _lerpMethod],
          ),
      ).accept(DartEmitter()).toString();

  String _objectGenerator() {
    final namedArguments = <String, Expression>{};

    for (final field in _colorFields) {
      namedArguments[field.name] = refer('$_annotationClass.${field.name}');
    }

    final expr = InvokeExpression.newOf(
      TypeReference(
        (typeRef) => typeRef
          ..symbol = _className
          ..url = 'package:flutter/material.dart',
      ),
      [],
      namedArguments,
    );

    return Field(
      (field) => field
        ..name = _className.replaceFirst(_className[0], _className[0].toLowerCase())
        ..modifier = FieldModifier.final$
        ..assignment = Code(expr.accept(DartEmitter()).toString()),
    ).accept(DartEmitter()).toString();
  }

  @override
  String code() => [
        _mixinGenerator(),
        _objectGenerator(),
      ].join('\n\n');
}
