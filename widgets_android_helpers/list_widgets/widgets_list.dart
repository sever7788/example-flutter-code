import 'package:flutter/material.dart';

import 'models/widget_data_model.dart';

const List<WidgetDataModel> widgetsList = [
  WidgetDataModel(
    widgetType: WidgetTypes.ordinary,
    size: Size(156, 156),
    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
    amountCities: 4,
  ),
  WidgetDataModel(
    widgetType: WidgetTypes.big,
    size: Size(310, 286),
    padding: EdgeInsets.symmetric(vertical: 21, horizontal: 24),
    amountCities: 5,
  ),
  WidgetDataModel(
    widgetType: WidgetTypes.mini,
    size: Size(178, 112),
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
    amountCities: 1,
  ),
  WidgetDataModel(
    widgetType: WidgetTypes.row,
    size: Size(356, 112),
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
    amountCities: 2,
  ),
  WidgetDataModel(
    widgetType: WidgetTypes.grid,
    size: Size(356, 204),
    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 6),
    amountCities: 4,
  ),
];
