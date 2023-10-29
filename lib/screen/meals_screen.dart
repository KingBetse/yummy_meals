import 'package:flutter/material.dart';
import 'package:yummy_meals/model/meals.dart';

import '../d_data.dart';
import '../widget/meal_item.dart';

class Meals_Screen extends StatefulWidget {
  final List<Meal> avalableMeals;
  final Function setFavorite;
  final Function isMealFavorite;

  Meals_Screen(this.avalableMeals, this.setFavorite, this.isMealFavorite);

  @override
  State<Meals_Screen> createState() => _Meals_ScreenState();
}

class _Meals_ScreenState extends State<Meals_Screen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArg['title'];
    final id = routeArg['id'];
    final CatagoryMeal = widget.avalableMeals.where(
      (element) {
        return element.categories.contains(id);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Meal_item(
              id: CatagoryMeal[index].id,
              title: CatagoryMeal[index].title,
              duration: CatagoryMeal[index].duration,
              complexity: CatagoryMeal[index].complexity,
              affordability: CatagoryMeal[index].affordability,
              imageURL: CatagoryMeal[index].imageUrl,
              setFavorite: widget.setFavorite,
              isfavorite: widget.isMealFavorite,
            );
          },
          itemCount: CatagoryMeal.length),
    );
  }
}
