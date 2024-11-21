import 'package:flutter/material.dart';

import 'package:timezo/constants/constants.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import 'separator.dart';
import 'models/city_data_model.dart';
import 'models/widget_data_model.dart';
import 'widgets/big_widget_row.dart';
import 'widgets/mini_widget_interior.dart';
import 'widgets/ordinary_widget_row.dart';

class TimeZoWidget extends StatelessWidget {
  const TimeZoWidget({super.key, required this.widgetData, required this.citiesData});

  final WidgetDataModel widgetData;
  final List<CityDataModel> citiesData;

  @override
  Widget build(BuildContext context) {
    final double width = widgetData.size.width;
    final double height = widgetData.size.height;
    final WidgetTypes widgetType = widgetData.widgetType;

    final selectedTheme = WidgetThemeState.of(context).selectedTheme;
    final double widgetOpacity = WidgetThemeState.of(context).widgetOpacity;

    final String? imagePath = selectedTheme.imagePath;
    final Color? color =
        imagePath == null ? selectedTheme.widgetColor.withOpacity(widgetOpacity) : null;

    return Center(
      child: FittedBox(
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(s22))),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (imagePath != null)
                Opacity(
                  opacity: widgetOpacity,
                  child: Container(
                    foregroundDecoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              Container(
                padding: widgetData.padding,
                decoration: BoxDecoration(color: color),
                child: widgetType == WidgetTypes.ordinary || widgetType == WidgetTypes.big
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: citiesData.map((CityDataModel city) {
                          if (widgetType == WidgetTypes.ordinary) {
                            return OrdinaryWidgetRow(
                              key: ValueKey(city),
                              cityData: city,
                              index: citiesData.indexOf(city),
                            );
                          } else {
                            return BigWidgetRow(key: ValueKey(city), cityData: city);
                          }
                        }).toList(),
                      )
                    : widgetType == WidgetTypes.mini
                        ? MiniWidgetInterior(cityData: citiesData[0])
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(child: MiniWidgetInterior(cityData: citiesData[0])),
                                    const Separator(),
                                    Flexible(child: MiniWidgetInterior(cityData: citiesData[1])),
                                  ],
                                ),
                              ),
                              if (widgetType == WidgetTypes.grid) const SizedBox(height: 20),
                              if (widgetType == WidgetTypes.grid)
                                Flexible(
                                  child: Row(
                                    children: [
                                      Flexible(child: MiniWidgetInterior(cityData: citiesData[2])),
                                      const Separator(),
                                      Flexible(child: MiniWidgetInterior(cityData: citiesData[3])),
                                    ],
                                  ),
                                ),
                            ],
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
