import 'package:flutter/material.dart';

import 'package:timezo/constants/constants.dart';

import 'plates_box.dart';
import 'add_widget_button.dart';
import 'not_add_widget.dart';
import 'opacity_slider/opacity_slider.dart';
import '../../ads_block/widget_screen_banner.dart';

class SettingUpWidgets extends StatelessWidget {
  const SettingUpWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: s12),
          child: const OpacitySlider(),
        ),
        const Spacer(flex: 7),
        Padding(
          padding: EdgeInsets.only(left: s12, right: s4),
          child: const PlatesBox(),
        ),
        const Spacer(flex: 9),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: s20),
          child: Row(
            children: [
              const Expanded(child: AddWidgetButton()),
              SizedBox(width: s8),
              const NotAddWidget(),
            ],
          ),
        ),
        const Spacer(flex: 8),
        const WidgetScreenBanner(),
      ],
    );
  }
}
