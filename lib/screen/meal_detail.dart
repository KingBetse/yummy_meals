import 'package:flutter/material.dart';
import 'package:yummy_meals/model/meals.dart';

import './../d_data.dart';

class Meal_Detail extends StatelessWidget {
  static String routeName = "/meals-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ), //fetching img??,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Indredient",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 150,
              width: isLandscape ? 600 : 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(
                    mainAxisAlignment: isLandscape
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          meal.ingredients[index],
                          style: TextStyle(fontSize: isLandscape ? 20 : 15),
                        ),
                      )
                    ],
                  ));
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            //Stepss
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "Steps",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 150,
              width: isLandscape ? 600 : 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: TextStyle(fontSize: isLandscape ? 20 : 15),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                      )
                    ],
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
