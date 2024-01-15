import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather/view/home_view.dart';

void main(List<String> args) {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.blue;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
    case 'overcast':
    case 'mist':
      return Colors.grey;
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.amber;
    case 'blowing snow':
    case 'blizzard':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.blue;
    case 'patchy sleet':
    case 'moderate or heavy sleet':
      return Colors.blueGrey;
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.indigo;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.amber;
    default:
      return Colors.grey;

    // Default color for unknown conditions
  }
}
