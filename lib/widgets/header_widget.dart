import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/screens/screens.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: const SizedBox(
            width: 55,
            height: 55,
            child: Icon(
              Icons.navigation_sharp,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        SizedBox(
          width: 55,
          height: 55,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: const SearchScreen(),
                ),
              );
            },
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            tooltip: "Search",
            iconSize: 35,
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
