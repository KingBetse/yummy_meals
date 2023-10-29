import 'package:flutter/material.dart';

import './../screen/favorite.dart';
import './../screen/catagory_screen.dart';
import './../screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  static String routeName = "/category-meals";

  Widget buildListtile(
    String title,
    IconData icon,
    handleTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1),
      ),
      onTap: handleTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 232, 240, 255),
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.blue,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Cooking Up!",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildListtile("Meals", Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            const SizedBox(
              height: 5,
            ),
            buildListtile("Filter", Icons.filter, () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
