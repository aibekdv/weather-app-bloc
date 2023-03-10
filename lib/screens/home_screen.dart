import 'package:flutter/material.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 9, 38, 1),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderWidget(city: "Medina"),
                  SizedBox(height: 20),
                  CurrentWeatherWidget()
                ],
              ),
            ),
            // Hourly Weather data widget
            const SizedBox(height: 10),
            const HourlyWidget(),
            const SizedBox(height: 20),
            const DailyWidget(),
          ],
        ),
      ),
    );
  }
}
