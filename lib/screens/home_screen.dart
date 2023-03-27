import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/widgets/custom_drawer.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = WeatherBloc();
  final bloc1 = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(FetchWeatherDataEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(12, 9, 38, 1),
              body: SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/bg.png"),
                      ),
                      const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Color(0xff1AB5ED),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          if (state is WeatherLoadingFailure) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(12, 9, 38, 1),
              body: SafeArea(
                child: Center(
                  child: Text(
                    "${state.getMessage()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Maven",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is WeatherLoadedState) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(12, 9, 38, 1),
              drawer: const CustomDrawer(),
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: const Color.fromRGBO(6, 199, 241, 1),
                    elevation: 0,
                    actions: [
                      IconButton(
                        onPressed: () {
                          bloc.add(FetchWeatherDataEvent(isLocation: true));
                        },
                        icon: const Icon(Icons.gps_fixed),
                      ),
                    ],
                  )
                ],
                body: RefreshIndicator(
                  onRefresh: () async {
                    final completer = Completer();
                    context.read<WeatherBloc>().add(
                          FetchWeatherDataEvent(completer: completer),
                        );
                    return completer.future;
                  },
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
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
                            const SizedBox(height: 5),
                            CurrentWeatherWidget(
                              currentWeather:
                                  state.weather.forecast!.forecastday[0].hour!,
                              city: state.weather.location!.name!.toString(),
                              bloc: bloc1,
                            )
                          ],
                        ),
                      ),
                      // Hourly Weather data widget
                      const SizedBox(height: 10),
                      HourlyWidget(
                        hourly: state.weather.forecast!.forecastday[0].hour!,
                        bloc: bloc1,
                      ),
                      const SizedBox(height: 20),
                      DailyWidget(
                        days: state.weather.forecast!.forecastday,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
