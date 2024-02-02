import 'package:extensions_builder/project_extensions.dart';
import 'package:flutter/material.dart';
part 'example.g.dart';

@ProjectExtensions(steps: [4, 8, 12, 16, 20, 24, 32, 48, 64, 80])
class AppSizes with _AppSizesMixin {
}

void main() {
  final t = AppSizes();

  allPadding4;
}