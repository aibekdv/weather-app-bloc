import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/models/weather/hour.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.currentWeather,
    required this.city,
    required this.bloc,
  });

  final List<Hour> currentWeather;
  final String city;
  final WeatherBloc bloc;

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  final int currentTimeIdx = int.parse(
    DateFormat("H").format(DateTime.now()),
  );

  int hourIndex = 0;
  List<Hour> hourData = [];

  @override
  void initState() {
    hourData = widget.currentWeather.sublist(currentTimeIdx);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get date time
    final String date = DateFormat("MMMMd").format(DateTime.now()).toString();
    final String dateHour = DateFormat("jm").format(DateTime.now()).toString();

    return Container(
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is HourlyIndexState) {
            hourIndex = state.hourIndex;
          }
          return CurrentWeather(
            widget: widget,
            date: date,
            dateHour: dateHour,
            hourData: hourData,
            hourIndex: hourIndex,
          );
        },
      ),
    );
  }
}

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
    required this.widget,
    required this.date,
    required this.dateHour,
    required this.hourData,
    required this.hourIndex,
  });

  final CurrentWeatherWidget widget;
  final String date;
  final String dateHour;
  final List<Hour> hourData;
  final int hourIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.white,
              size: 28,
            ),
            Text(
              widget.city,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Maven",
                fontWeight: FontWeight.w500,
                fontSize: 35,
                height: 1.3,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "$date, $dateHour",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "Maven",
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              "https:${hourData[hourIndex].condition!.icon}",
              width: 120,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                return SizedBox(
                  width: 120,
                  height: 120,
                  child: child,
                );
              },
            ),
            RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${hourData[hourIndex].tempC!.round().toString()}°",
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Maven",
                    ),
                  ),
                  TextSpan(
                    text: hourData[hourIndex].condition!.text!.length > 8
                        ? "${hourData[hourIndex].condition!.text!.substring(0, 8)}..."
                        : hourData[hourIndex].condition!.text!,
                    style: const TextStyle(
                      color: Color.fromRGBO(250, 253, 116, 1),
                      fontSize: 14,
                      fontFamily: "Maven",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/feels.png"),
                Text(
                  "${hourData[hourIndex].feelslikeC}°",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Maven",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Wind.png"),
                Text(
                  "${hourData[hourIndex].windKph!} km/h",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Maven",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/inve.png"),
                Text(
                  "${hourData[hourIndex].humidity} %",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Maven",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
