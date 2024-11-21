import 'package:flutter/material.dart';

import '../../../screens/widgets_android_screen/widget_theme_state.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    final Color separatorColor = WidgetThemeState.of(context).selectedTheme.separatorColor;

    return Container(width: 1, color: separatorColor.withOpacity(.35));
  }
}
