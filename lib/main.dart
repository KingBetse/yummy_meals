import 'package:flutter/material.dart';
import 'package:yummy_meals/model/meals.dart';

// import '../screen/meals_screen.dart';
import './screen/meals_screen.dart';
import './widget/cata_item.dart';
import './widget/meal_item.dart';
import './screen/meal_detail.dart';
import './screen/tab_screen.dart';
import './screen/filter_screen.dart';
import './d_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'gluton': false,
    'vegan': false,
    'vegitarian': false,
    'lactose': false,
  };
  List<Meal> avaliableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFillters(Map<String, bool> filterData) {
    setState(() {
      filter = filterData;
      avaliableMeals = DUMMY_MEALS.where((element) {
        if (filter['gluton']! && !element.isGlutenFree) {
          return false;
        }
        if (filter['vegan']! && !element.isVegan) {
          return false;
        }
        if (filter['vegitarian']! && !element.isVegetarian) {
          return false;
        }
        if (filter['lactose']! && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void SetFavorite(String mealid) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealid);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
      // home: TabScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favoriteMeals, SetFavorite, isMealFavorite),
        CategoryItem.routeName: (ctx) =>
            Meals_Screen(avaliableMeals, SetFavorite, isMealFavorite),
        Meal_item.routeName: (ctx) => Meal_Detail(),
        FilterScreen.routeName: (ctx) => FilterScreen(filter, setFillters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
