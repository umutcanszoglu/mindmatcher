import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mindmatcher/consts/teams.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/teams_card.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 190.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
      items: Teams.teams.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: TeamsCard(
                color: orange,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
