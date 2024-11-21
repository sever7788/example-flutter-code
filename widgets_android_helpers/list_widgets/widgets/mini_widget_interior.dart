import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timezo/bloc/bloc.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import 'w_text_styles.dart';
import '../../../my_icon.dart';
import '../models/city_data_model.dart';

class MiniWidgetInterior extends StatelessWidget {
  const MiniWidgetInterior({super.key, required this.cityData});

  final CityDataModel cityData;

  @override
  Widget build(BuildContext context) {
    final bool is24HoursFormat = BlocProvider.of<SettingsBloc>(context).state.is24HoursFormat;

    final selectedTheme = WidgetThemeState.of(context).selectedTheme;
    final Color textColor = selectedTheme.textColor;
    final String iconName = cityData.isDay ? IconNames.sun : IconNames.moon;
    final Color iconColor =
        cityData.isDay ? selectedTheme.sunIconColor : selectedTheme.moonIconColor;
    final textShadows = WidgetThemeState.of(context).shadows;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityData.cityName,
                      style: WTextStyles.subtitle.copyWith(color: textColor, shadows: textShadows),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(cityData.day,
                        style:
                            WTextStyles.caption.copyWith(color: textColor, shadows: textShadows)),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              MyIcon(iconName: iconName, color: iconColor, size: 24),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(cityData.time,
                  style: WTextStyles.header1.copyWith(color: textColor, shadows: textShadows)),
              if (!is24HoursFormat)
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5, left: 2),
                    child: Text(
                      cityData.ampm,
                      style: WTextStyles.caption1.copyWith(color: textColor, shadows: textShadows),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
