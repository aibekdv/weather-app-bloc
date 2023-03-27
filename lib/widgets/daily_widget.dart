import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather/forecastday.dart';

class DailyWidget extends StatefulWidget {
  const DailyWidget({super.key, required this.days});
  final List<Forecastday> days;

  @override
  State<DailyWidget> createState() => _DailyWidgetState();
}

class _DailyWidgetState extends State<DailyWidget> {
  List<Forecastday> daysList = [];

  @override
  void initState() {
    daysList = widget.days.sublist(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            "Next days",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Maven",
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(7, 185, 224, 1),
                Color.fromRGBO(6, 72, 241, 1),
              ],
            ),
          ),
          child: dailyList(),
        )
      ],
    );
  }

  Widget dailyList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: daysList.length,
      itemBuilder: (context, index) {
        String weekDay = DateFormat("MMMMd").format(
          DateTime.fromMillisecondsSinceEpoch(
              daysList[index].dateEpoch! * 1000),
        );

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    weekDay,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.network(
                      "http:${daysList[index].day!.condition!.icon}",
                    ),
                  ),
                  Text(
                    "${daysList[index].day!.mintempC?.toInt()}° / ${widget.days[index].day!.maxtempC?.toInt()}°",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
