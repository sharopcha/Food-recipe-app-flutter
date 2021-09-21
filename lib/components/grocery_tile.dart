import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  add row to geoup { name adate importance }
          Row(
            children: [
              Container(width: 5.0, color: item.color),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        decoration: textDecoration,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  buildDate(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  buildImportance()
                ],
              ),
            ],
          ),
          // TODO: 23 add row to group { quantity checkbox }
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                    decoration: textDecoration, fontSize: 21.0),
              ),
              buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text(
        'Low',
        style: GoogleFonts.lato(
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
            decoration: textDecoration, fontWeight: FontWeight.w800),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
            decoration: textDecoration,
            fontWeight: FontWeight.w900,
            color: Colors.red),
      );
    } else {
      throw Exception('This importance does not exist!');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget buildCheckbox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}
