import 'package:flutter/material.dart';

import './../widget/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";
  final Function setFilter;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.setFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutonFree = false;
  bool isVegan = false;
  bool isVegiterian = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutonFree = widget.currentFilter['gluton']!;
    isVegan = widget.currentFilter['vegan']!;
    isVegiterian = widget.currentFilter['vegitarian']!;
    lactoseFree = widget.currentFilter['lactose']!;
    super.initState();
  }

  Widget buildSwitch(bool kind, String title, String subtitle, handleSwitch) {
    return SwitchListTile(
      value: kind,
      onChanged: handleSwitch,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        actions: [
          IconButton(
              onPressed: () {
                final selected = {
                  'gluton': glutonFree,
                  'vegan': isVegan,
                  'vegitarian': isVegiterian,
                  'lactose': lactoseFree,
                };
                widget.setFilter(selected);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildSwitch(
                  glutonFree,
                  "Gluton Free",
                  "Only have Gluton Free Meals",
                  (newValue) {
                    setState(() {
                      glutonFree = newValue;
                    });
                  },
                ),
                buildSwitch(
                  isVegan,
                  "Vegan",
                  "Only have Vegan  Meals",
                  (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                buildSwitch(
                  isVegiterian,
                  "Vegiterian",
                  "Only have Vegitarian Meals",
                  (newValue) {
                    setState(() {
                      isVegiterian = newValue;
                    });
                  },
                ),
                buildSwitch(
                  lactoseFree,
                  "Lactose Free",
                  "Only have Lactose Free Meals",
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
