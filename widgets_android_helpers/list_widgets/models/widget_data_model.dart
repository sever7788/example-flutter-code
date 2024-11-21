import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

enum WidgetTypes {
  /// Free widget with cities list.
  ordinary,

  /// Widget with date in column.
  big,

  /// Widget with date and sun/moon.
  mini,

  /// Widget with date and sun/moon.
  row,

  /// Widget with date and sun/moon.
  grid,
}

class WidgetDataModel extends Equatable {
  const WidgetDataModel({
    required this.widgetType,
    required this.size,
    required this.padding,
    required this.amountCities,
  });

  final WidgetTypes widgetType;
  final Size size;
  final EdgeInsets padding;
  final int amountCities;

  @override
  List<Object?> get props => [widgetType, size, padding, amountCities];
}
