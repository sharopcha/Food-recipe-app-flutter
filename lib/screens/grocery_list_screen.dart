import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/grocery_tile.dart';
import 'package:food_recipe_apprentice/models/grocery_manager.dart';
import 'package:food_recipe_apprentice/screens/gocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({Key? key, required this.manager}) : super(key: key);

  final GroceryManager manager;

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          // TODO: 28 Wrap in a dismisable

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                          originalItem: item,
                          onUpdate: (item) {
                            manager.updateItem(item, index);
                            Navigator.pop(context);
                          },
                        )),
              );
            },
            child: GroceryTile(
              key: Key(item.id.toString()),
              item: item,
              onComplete: (change) {
                manager.completeItem(index, change!);
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16.0,
          );
        },
      ),
    );
  }
}
