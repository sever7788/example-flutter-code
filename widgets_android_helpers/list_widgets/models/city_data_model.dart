import 'package:equatable/equatable.dart';

class CityDataModel extends Equatable {
  const CityDataModel({
    required this.cityName,
    required this.countryName,
    required this.time,
    required this.ampm,
    required this.day,
    required this.utc,
    required this.isDay,
  });

  final String cityName;
  final String countryName;
  final String time;
  final String ampm;
  final String day;
  final String utc;
  final bool isDay;

  CityDataModel setDatTime(bool isDay) => CityDataModel(
        cityName: cityName,
        countryName: countryName,
        time: time,
        ampm: ampm,
        day: day,
        utc: utc,
        isDay: isDay,
      );

  @override
  List<Object?> get props => [cityName, countryName, time, ampm, day, utc, isDay];
}
