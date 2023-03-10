import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HourlyWidget extends StatelessWidget {
  const HourlyWidget({super.key});

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
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: index == 0
                  ? const Color(0xff0052EF)
                  : const Color(0xff00B9E0),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "11:00",
                  style: TextStyle(
                    color: index == 0 ? Colors.white : const Color(0xff000027),
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Image.network(
                  "https://cdn.weatherapi.com/weather/64x64/night/116.png",
                  width: 60,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                Text(
                  "29°",
                  style: TextStyle(
                    color: index == 0 ? Colors.white : const Color(0xff000027),
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
