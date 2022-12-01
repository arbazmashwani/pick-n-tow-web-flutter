import 'package:flutter/material.dart';

totalinfoContainer(String value, String text, IconData icon, Color color) {
  return Container(
      color: color.withOpacity(0.90),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 1),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Text(
                          value,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Text(
                          text,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: SizedBox(
                  child: Opacity(
                    opacity: 0.40,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        icon,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 18,
                color: color,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "More Info",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                )),
              ))
        ],
      ));
}
