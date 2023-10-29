import 'package:flutter/material.dart';
import '../../screen/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  static String routeName = "/category-meals";
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.title, this.color, this.id);

  void setMealScreen(ctx) {
    Navigator.of(ctx)
        .pushNamed(routeName, arguments: {'title': title, "id": id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setMealScreen(context),
      splashColor: const Color.fromARGB(255, 85, 250, 197),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontFamily: "Poppins", fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
