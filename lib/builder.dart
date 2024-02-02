import 'package:build/build.dart';
import 'package:extensions_builder/src/project_extensions_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder projectExtensionsBuilder(BuilderOptions options) =>
    SharedPartBuilder([ProjectExtensionsGenerator()], 'projectExtensionsBuilder');
