import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timezo/bloc/bloc.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import 'w_text_styles.dart';
import '../models/city_data_model.dart';

class OrdinaryWidgetRow extends StatelessWidget {
  const OrdinaryWidgetRow({
    super.key,
    required this.cityData,
    required this.index,
  });

  final CityDataModel cityData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool is24HoursFormat = BlocProvider.of<SettingsBloc>(context).state.is24HoursFormat;
    final Color textColor = WidgetThemeState.of(context).selectedTheme.textColor;
    final textShadows = WidgetThemeState.of(context).shadows;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            cityData.cityName,
            overflow: TextOverflow.ellipsis,
            style: WTextStyles.caption2.copyWith(color: textColor, height: 1, shadows: textShadows),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Text(cityData.time,
                    style: WTextStyles.body2.copyWith(color: textColor, shadows: textShadows)),
                if (index == 0)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 1,
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                          color: textColor,
                          boxShadow: textShadows != null
                              ? const [
                                  BoxShadow(
                                      color: Color(0xFF262626),
                                      offset: Offset(1, 1),
                                      blurRadius: 4),
                                ]
                              : null),
                    ),
                  ),
              ],
            ),
            if (!is24HoursFormat)
              Container(
                margin: const EdgeInsets.only(bottom: 2, left: 1),
                child: Text(cityData.ampm,
                    style: WTextStyles.little1.copyWith(color: textColor, shadows: textShadows)),
              ),
          ],
        ),
      ],
    );
  }
}
