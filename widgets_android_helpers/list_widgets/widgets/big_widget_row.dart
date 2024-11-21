import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timezo/bloc/bloc.dart';

import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import 'w_text_styles.dart';
import '../models/city_data_model.dart';

class BigWidgetRow extends StatelessWidget {
  const BigWidgetRow({super.key, required this.cityData});

  final CityDataModel cityData;

  @override
  Widget build(BuildContext context) {
    final bool is24HoursFormat = BlocProvider.of<SettingsBloc>(context).state.is24HoursFormat;
    final textShadows = WidgetThemeState.of(context).shadows;
    final theme = WidgetThemeState.of(context).selectedTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityData.cityName,
                    style:
                        WTextStyles.subtitle.copyWith(color: theme.textColor, shadows: textShadows),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    cityData.utc,
                    style: WTextStyles.subtitle1
                        .copyWith(color: theme.subtextColor, shadows: textShadows),
                  ),
                ],
              ),
              Text(
                '${cityData.day} | ${cityData.countryName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    WTextStyles.subtitle1.copyWith(color: theme.subtextColor, shadows: textShadows),
              ),
            ],
          ),
        ),
        const SizedBox(width: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(cityData.time,
                style: WTextStyles.header0.copyWith(color: theme.textColor, shadows: textShadows)),
            if (!is24HoursFormat)
              Container(
                margin: const EdgeInsets.only(bottom: 5, left: 6),
                child: Text(cityData.ampm,
                    style: WTextStyles.caption1
                        .copyWith(color: theme.textColor, shadows: textShadows)),
              ),
          ],
        ),
      ],
    );
  }
}
