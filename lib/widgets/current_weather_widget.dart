import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // get date time
    final String date = DateFormat("yMMMd").format(DateTime.now()).toString();

    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 35,
              ),
              Text(
                "Bishkek",
                style: TextStyle(
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
              date,
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
                "https://cdn.weatherapi.com/weather/64x64/night/116.png",
                width: 130,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return SizedBox(
                    width: 130,
                    height: 130,
                    child: child,
                  );
                },
              ),
              Container(
                width: 1,
                color: Colors.white,
                height: 60,
              ),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '27°',
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Maven",
                      ),
                    ),
                    TextSpan(
                      text: 'cloudy',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 253, 116, 1),
                        fontSize: 24,
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
            margin: const EdgeInsets.symmetric(horizontal: 30),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 120,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Wind.png"),
                      const Text(
                        "13 km/h",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Maven",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Wind",
                        style: TextStyle(
                          color: Color.fromRGBO(232, 232, 232, 0.7),
                          fontFamily: "Maven",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/inve.png"),
                    const Text(
                      "24%",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Maven",
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Humidity",
                      style: TextStyle(
                        color: Color.fromRGBO(232, 232, 232, 0.7),
                        fontFamily: "Maven",
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Moisture.png"),
                      const Text(
                        "82%",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Maven",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Chance of rain",
                        style: TextStyle(
                          color: Color.fromRGBO(232, 232, 232, 0.7),
                          fontFamily: "Maven",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
