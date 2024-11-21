import 'package:flutter/material.dart';

import 'package:timezo/constants/constants.dart';
import 'package:timezo/screens/widgets_android_screen/widget_themes.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import '../../theme_plate.dart';

class PlatesBox extends StatelessWidget {
  const PlatesBox({super.key});

  @override
  Widget build(BuildContext context) {
    final WidgetThemeState widgetThemeState = WidgetThemeState.of(context);
    final Color accentMainColor = Theme.of(context).colorScheme.tertiaryContainer;

    return SizedBox(
      height: s72,
      child: ListView(
        cacheExtent: s72 * 21,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: widgetThemes.map((theme) {
          final int index = widgetThemes.indexOf(theme);

          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: s8),
            child: ThemePlate(
              image: theme.imagePath != null
                  ? Image.asset(
                      width: s72,
                      height: s72,
                      theme.imagePath!,
                      fit: BoxFit.cover,
                    )
                  : null,
              color: theme.imagePath == null ? theme.color : null,
              accentSelectedColor: accentMainColor,
              isSelected: widgetThemeState.selectedThemeIndex == index,
              onTap: () => widgetThemeState.changeThemeIndex(index),
            ),
          );
        }).toList(),
      ),
    );
  }
}
