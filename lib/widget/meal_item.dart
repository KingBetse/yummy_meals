// ignore_for_file: dead_code

import 'package:flutter/material.dart';

import '../model/meals.dart';
import './../screen/meal_detail.dart';

class Meal_item extends StatelessWidget {
  static String routeName = "/meals-detail";
  final String id;
  final String title;
  final int duration;
  final String imageURL;
  final Affordability affordability;
  final Complexity complexity;
  final Function setFavorite;
  final Function isfavorite;

  // final String imageUrl;    // will do it when i get internet
  String get complextyText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;

      case Complexity.Hard:
        return "Hard";
        break;

      case Complexity.Challenging:
        return "Challenging";
        break;

      default:
        return "Unknown";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;

      case Affordability.Luxurious:
        return "Luxurious";
        break;

      case Affordability.Pricey:
        return "Pricey";
        break;

      default:
        return "Unknown";
        break;
    }
  }

  Meal_item(
      {required this.id,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.imageURL,
      required this.affordability,
      required this.setFavorite,
      required this.isfavorite});
  void selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      margin: EdgeInsets.all(isLandscape ? 10 : 3),
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Container(
          // width: isLandscape == true ? 500 : double.infinity,
          margin: const EdgeInsets.all(5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageURL,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ) //fetching img??
                    ,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: isLandscape ? 700 : 300,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(right: isLandscape ? 40 : 0),
                        onPressed: () => setFavorite(id),
                        icon: Icon(
                          isfavorite(id)
                              ? Icons.star
                              : Icons.star_border_rounded,
                          size: isLandscape ? 60 : 40,
                          color: const Color.fromARGB(255, 255, 231, 11),
                        ),
                        highlightColor: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: isLandscape
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: isLandscape ? 15 : 0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${duration} min",
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: isLandscape ? 35 : 0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.price_change,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${affordabilityText}",
                          style:
                              const TextStyle(letterSpacing: 1, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: isLandscape ? 35 : 0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.compost,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${complextyText}",
                          style:
                              const TextStyle(letterSpacing: 1, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      width: isLandscape ? 35 : 0,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
