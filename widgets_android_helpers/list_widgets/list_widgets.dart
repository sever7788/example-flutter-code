import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:timezo/bloc/bloc.dart';
import 'package:timezo/constants/constants.dart';
import 'package:timezo/screens/widgets_android_screen/widget_theme_state.dart';

import 'widgets_list.dart';
import 'time_zo_widget.dart';
import '../../image_asset.dart';
import 'generate_cities_data.dart';
import '../../pages_indicator.dart';
import 'models/city_data_model.dart';
import 'models/widget_data_model.dart';

class ListWidgets extends StatefulWidget {
  const ListWidgets({super.key, required this.header, required this.pageController});

  final Widget header;
  final PageController pageController;

  @override
  State<ListWidgets> createState() => _ListWidgetsState();
}

class _ListWidgetsState extends State<ListWidgets> {
  List<CityDataModel> citiesData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _generateList());
  }

  void _generateList() async {
    final SettingsState state = BlocProvider.of<SettingsBloc>(context).state;
    final String localeName = AppLocalizations.of(context)!.localeName;

    await generateCitiesData(localeName, state.is24HoursFormat, state.timeStandardName)
        .then((value) {
      setState(() {
        citiesData = value;
      });
    }).then((value) => Future.delayed(const Duration(milliseconds: 500), _calculateSunData));
  }

  void _calculateSunData() {
    final List<bool> daysData = getIsDayList();

    final List<CityDataModel> listWithSunResult = citiesData.map((city) {
      final int index = citiesData.indexOf(city);
      if (index < daysData.length) {
        return city.setDatTime(daysData[index]);
      } else {
        return city;
      }
    }).toList();

    setState(() {
      citiesData = listWithSunResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(s24)),
        image: const DecorationImage(
          image: AssetImage('assets/images/${ImageNames.widgetsScreenBg}'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          widget.header,
          SizedBox(height: s16),
          Expanded(
            child: PageView(
              controller: widget.pageController,
              children: widgetsList.map((WidgetDataModel widget) {
                List<CityDataModel> list = [];
                if (citiesData.isNotEmpty) {
                  list = citiesData.toList()..removeRange(widget.amountCities, citiesData.length);
                }

                return TimeZoWidget(
                  key: ValueKey(widget.widgetType),
                  widgetData: widget,
                  citiesData: list,
                );
              }).toList(),
            ),
          ),
          PagesIndicator(
            amount: WidgetTypes.values.length,
            selectedPage: WidgetThemeState.of(context).selectedWidget,
          ),
        ],
      ),
    );
  }
}
