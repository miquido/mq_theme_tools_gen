class ProjectExtensions {
  /// Provide a various properties as [Color] type to generate AppTheme class with copyWith and lerp methods. Also you can generate EdgeInsets and SizedBox using [steps] in annotation.

  const ProjectExtensions({this.steps = const {4, 8, 12, 16, 20, 24, 32, 48, 64}});

  /// These values are used for generating EdgeInsets and SizedBox to be used in a user interface or layout design. Each value in this set represents a discrete step in sizing, allowing for consistent and scalable design elements.
  final Set<int> steps;
}
