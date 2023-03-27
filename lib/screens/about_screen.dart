import 'dart:ui';

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/about.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Maven",
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "This weather app is developed by ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Maven",
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: " Aibek Karataev. ",
                                style: TextStyle(
                                  color: Color.fromRGBO(6, 199, 241, 1),
                                  fontFamily: "Maven",
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "This project uses a ready-made API (weatherapi.com) to get weather data. ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Maven",
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "This program is made for practice only.",
                                style: TextStyle(
                                  color: Color.fromRGBO(6, 199, 241, 1),
                                  fontFamily: "Maven",
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
