import 'package:flutter/material.dart';

import 'widget_themes.dart';
import 'package:timezo/data/data.dart';
import 'package:timezo/widgets/widgets.dart';

const textShadow = Shadow(color: Color(0xFF262626), offset: Offset(1, 1), blurRadius: 4);

class WidgetThemeState extends InheritedWidget {
  const WidgetThemeState({
    super.key,
    required super.child,
    required this.widgetOpacity,
    required this.selectedThemeIndex,
    required this.setWidgetOpacity,
    required this.changeThemeIndex,
    required this.selectedWidget,
  });

  final double widgetOpacity;
  final int selectedThemeIndex;
  final int selectedWidget;

  final void Function(double) setWidgetOpacity;
  final void Function(int) changeThemeIndex;

  WidgetThemeAndroid get selectedTheme => widgetThemes[selectedThemeIndex];

  List<Shadow>? get shadows => selectedTheme.imagePath != null ? [textShadow] : null;

  /// Selected Premium Theme.
  // bool get selectedPremiumTheme => selectedThemeIndex > 1;

  /// Selected Premium Widget.
  // bool get selectedPremiumWidget => selectedWidget > 0;

  WidgetTypes get selectedWidgetName => widgetsList[selectedWidget].widgetType;

  static WidgetThemeState of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<WidgetThemeState>();
    assert(state != null, 'No WidgetThemeState found in context.');
    return state!;
  }

  @override
  bool updateShouldNotify(WidgetThemeState oldWidget) =>
      selectedThemeIndex != oldWidget.selectedThemeIndex ||
      widgetOpacity != oldWidget.widgetOpacity ||
      selectedWidget != oldWidget.selectedWidget;
}
