import 'package:flutter/material.dart';

import './../model/meals.dart';
import './catagory_screen.dart';
import './favorite.dart';
import './../widget/mainDrawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteList;
  final Function setFavorite;
  final Function isMealFavorite;

  TabScreen(this.favoriteList, this.setFavorite, this.isMealFavorite);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Widget> page;
  int selectedPageIndex = 0;
  void selectePage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    page = [
      Catagory_screen(),
      Favorite(widget.favoriteList, widget.setFavorite, widget.isMealFavorite),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: selectedPageIndex == 0
            ? const Text("Categories")
            : const Text("Favorite"),
      ),
      drawer: MainDrawer(),
      body: page[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectePage,
        backgroundColor: Color.fromARGB(255, 68, 171, 255),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.brown,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
        ],
      ),
    );
  }
}
