import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/models/hour.dart';

class HourlyWidget extends StatefulWidget {
  const HourlyWidget({super.key, required this.hourly});
  final List<Hour> hourly;

  @override
  State<HourlyWidget> createState() => _HourlyWidgetState();
}

class _HourlyWidgetState extends State<HourlyWidget> {
  int hourlyIndex = 0;
  final int currentTimeIdx = int.parse(
    DateFormat("H").format(DateTime.now()),
  );
  // final WeatherBloc bloc = GetIt.I<WeatherBloc>();

  List<Hour> hourlyData = [];

  @override
  void initState() {
    hourlyData = widget.hourly.sublist(currentTimeIdx);
    super.initState();
  }

  @override
  void dispose() {
    GetIt.I<WeatherBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Maven",
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.antiAlias,
        addAutomaticKeepAlives: true,
        dragStartBehavior: DragStartBehavior.down,
        itemCount: hourlyData.length,
        itemBuilder: (context, index) {
          return BlocBuilder<WeatherBloc, WeatherState>(
            bloc: GetIt.I<WeatherBloc>(),
            builder: (context, state) {
              if (state is HourlyIndexState) {
                hourlyIndex = state.hourIndex;
              }
              return GestureDetector(
                onTap: () {
                  GetIt.I<WeatherBloc>().add(
                    ChangeHourlyIndexEvent(index),
                  );
                },
                child: Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: index == hourlyIndex
                        ? const Color(0xff0052EF)
                        : const Color(0xff00B9E0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DateFormat("jm").format(
                          DateTime.fromMillisecondsSinceEpoch(
                            hourlyData[index].timeEpoch! * 1000,
                          ),
                        ),
                        style: TextStyle(
                          color: index == hourlyIndex
                              ? Colors.white
                              : const Color(0xff000027),
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Image.network(
                        "https:${hourlyData[index].condition!.icon.toString()}",
                        width: 60,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "${hourlyData[index].tempC?.round()}°",
                        style: TextStyle(
                          color: index == hourlyIndex
                              ? Colors.white
                              : const Color(0xff000027),
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
