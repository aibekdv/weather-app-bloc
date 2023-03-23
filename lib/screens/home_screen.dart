import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = WeatherBloc();

    return BlocProvider(
      create: (context) => bloc..add(FetchWeatherDataEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(12, 9, 38, 1),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  if (state is WeatherLoadingState)
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  if (state is WeatherLoadedState)
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          // Current weather data and Header widgets
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(6, 199, 241, 1),
                                  Color.fromRGBO(7, 185, 224, 1),
                                  Color.fromRGBO(6, 72, 241, 1),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const HeaderWidget(),
                                const SizedBox(height: 20),
                                CurrentWeatherWidget(
                                  currentWeather: state
                                      .weather.forecast!.forecastday![0].hour!,
                                  city:
                                      state.weather.location!.name!.toString(),
                                )
                              ],
                            ),
                          ),
                          // Hourly Weather data widget
                          const SizedBox(height: 10),
                          HourlyWidget(
                            hourly:
                                state.weather.forecast!.forecastday![0].hour!,
                          ),
                          const SizedBox(height: 20),
                          const DailyWidget(),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
