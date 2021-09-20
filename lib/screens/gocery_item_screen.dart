import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemScreen extends StatefulWidget {
  const GroceryItemScreen({
    Key? key,
    this.onCreate,
    this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  final Function(GroceryItem)? onCreate;
  final Function(GroceryItem)? onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    if (widget.originalItem != null) {
      _nameController.text = widget.originalItem!.name;
      _name = widget.originalItem!.name;
      _currentSliderValue = widget.originalItem!.quantity;
      _importance = widget.originalItem!.importance;
      _currentColor = widget.originalItem!.color;
      final date = widget.originalItem!.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // TODO: 24 Add Callback
            },
          )
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TODO: 13 Add name text field
            // TODO: 14 add importance selection
            // TODO: 15 add data picker
            // TODO: 16 add time picker
            // TODO: 17 add color picker
            // TODO: 18 add slider
            // TODO: 19 add grocery tile
          ],
        ),
      ),
    );
  }
}
