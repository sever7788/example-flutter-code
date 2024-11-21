import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';
import 'package:iso_countries/iso_countries.dart';
import 'package:sunrise_sunset_calc/sunrise_sunset_calc.dart';

import 'package:timezo/data/data.dart';
import 'package:timezo/utils/utils.dart';
import 'package:timezo/constants/constants.dart';

import 'models/city_data_model.dart';

Future<List<CityDataModel>> generateCitiesData(
  String localeName,
  bool is24HoursFormat,
  String timeStandard,
) async {
  List<CityDataModel> list = [];

  for (var city in exampleCities) {
    final Country country =
        await IsoCountries.isoCountryForCodeForLocale(city.country, localeIdentifier: localeName);

    final DateTime currentDate = TZDateTime.now(getLocation(city.tz));

    final String ampm = DateFormat('a').format(currentDate);
    final String day = DateFormat('EEE, MMM d', localeName).format(currentDate);
    final String time = DateFormat(is24HoursFormat ? 'Hm' : 'hh:mm').format(currentDate);

    final CityDataModel dataModel = CityDataModel(
      cityName: city.displayCityName(localeName).trim(),
      countryName: renamedCountryName(country.name),
      time: time,
      ampm: ampm,
      day: day,
      utc: timeStandard + getUtcFromDate(currentDate),
      isDay: true,
    );

    list.add(dataModel);
  }

  return list;
}

List<bool> getIsDayList() {
  return List.generate(4, (index) {
    final City city = exampleCities[index];

    final DateTime currentDate = TZDateTime.now(getLocation(city.tz));
    final SunriseSunsetResult sunResult = getSunResult(city, currentDate);

    final bool isDay =
        currentDate.isAfter(sunResult.sunrise) && currentDate.isBefore(sunResult.sunset);

    return isDay;
  });
}
