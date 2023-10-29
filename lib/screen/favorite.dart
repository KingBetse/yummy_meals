import 'package:flutter/material.dart';
import 'package:yummy_meals/model/meals.dart';
import './../widget/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteList;
  final Function setFavorite;
  final Function isMealFavorite;

  Favorite(this.favoriteList, this.setFavorite, this.isMealFavorite);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteList.isEmpty
          ? const Center(
              child: Text("No favorite at the Moment"),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Meal_item(
                  id: favoriteList[index].id,
                  title: favoriteList[index].title,
                  duration: favoriteList[index].duration,
                  complexity: favoriteList[index].complexity,
                  imageURL: favoriteList[index].imageUrl,
                  affordability: favoriteList[index].affordability,
                  setFavorite: setFavorite,
                  isfavorite: isMealFavorite,
                );
              },
              itemCount: favoriteList.length),
    );
  }
}
