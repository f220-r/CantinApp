import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> ingredients;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.ingredients, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  bool gah = true;
  List<String> selectedChoices = List();

  _buildChoiceList() {
    if (gah) {
      for (int i = 0; i < widget.ingredients.length; i++)
        selectedChoices.add(widget.ingredients[i]);
      gah = false;
    }
    List<Widget> choices = List();
    widget.ingredients.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
