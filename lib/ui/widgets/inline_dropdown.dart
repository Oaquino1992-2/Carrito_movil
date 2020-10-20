import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InlineDropdown extends StatefulWidget {
  final String label;
  String value;
  final List<String> options;

  InlineDropdown(this.label, this.options, this.value);

  @override
  _InlineDropdownState createState() => _InlineDropdownState();
}

class _InlineDropdownState extends State<InlineDropdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(widget.label),
        ),
        Expanded(
          child: DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            isExpanded: true,
            value: widget.value,
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              setState(() {
                widget.value = newValue;
              });
            },
            items: widget.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  width: 100,
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
