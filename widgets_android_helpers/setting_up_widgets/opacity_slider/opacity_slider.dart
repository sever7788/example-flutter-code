import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:typed_data';

import 'package:timezo/constants/constants.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import 'opacity_circle.dart';
import '../../../image_asset.dart';

class OpacitySlider extends StatefulWidget {
  const OpacitySlider({super.key});

  @override
  State<OpacitySlider> createState() => _OpacitySliderState();
}

class _OpacitySliderState extends State<OpacitySlider> {
  double left = 0;
  double containerSize = 0;

  final double circleSize = s28;

  final GlobalKey _key = GlobalKey();

  WidgetThemeState get widgetThemeState => WidgetThemeState.of(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerSize = _key.currentContext?.size?.width ?? 0;
        left = widgetThemeState.widgetOpacity * (containerSize - circleSize);
      });
    });
  }

  void moveHandler(details) {
    setState(() {
      left = min(
        max(0, details.localPosition.dx - circleSize / 2),
        containerSize - circleSize,
      );
    });
    widgetThemeState.setWidgetOpacity(left / (containerSize - circleSize));
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(context).colorScheme.primaryContainer;

    final String? imagePath = widgetThemeState.selectedTheme.imagePath;

    final Color color = imagePath == null ? widgetThemeState.selectedTheme.color : Colors.black;

    return GestureDetector(
      onPanUpdate: moveHandler,
      onPanStart: moveHandler,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        key: _key,
        height: s50,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: s8,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/${ImageNames.checkers}'),
                  repeat: ImageRepeat.repeatX,
                  opacity: 0.1,
                ),
                border: Border.all(width: s1, color: borderColor),
                borderRadius: BorderRadius.circular(s12),
              ),
              clipBehavior: Clip.hardEdge,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(s11),
                  gradient: LinearGradient(colors: [color.withOpacity(0), color]),
                ),
              ),
            ),
            OpacityCircle(
              left: left,
              color: color,
              circleSize: circleSize,
              containerSize: containerSize,
              image: imagePath != null ? Image.asset(imagePath, fit: BoxFit.cover) : null,
            ),
          ],
        ),
      ),
    );
  }
}
