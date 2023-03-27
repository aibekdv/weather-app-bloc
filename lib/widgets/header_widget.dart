import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.bloc});

  final WeatherBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15, top: 10),
          child: InkWell(
            onTap: () async {
              bloc.add(FetchWeatherDataEvent(isLocation: true));
            },
            child: SizedBox(
              width: 35,
              height: 35,
              child: Image.asset("assets/images/gps.png"),
            ),
          ),
        ),
      ],
    );
  }
}
