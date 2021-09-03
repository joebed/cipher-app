import 'package:flutter/material.dart';

import '../models/enums.dart';

class CaesarForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String message = '';
  int? shiftSize;
  Direction shiftDirection = Direction.Forward;

  String _formatMessage(String oldString) {
    String newString = '';
    String noSpaces = oldString.replaceAll(' ', '');
    for (int i = 0; i < noSpaces.length; i++) {
      newString += noSpaces[i];
      if (i % 5 == 4) newString += ' ';
    }
    return newString;
  }

  Widget _showCodedMessage() {
    return Text('Hell yeah bruh');
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState == null || !_formKey.currentState!.validate())
      return;
    print(_formatMessage(message));
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Code'),
    //       content: _showCodedMessage(),
    //       actions: [
    //         TextButton(
    //           child: Text('Noice'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         )
    //       ],
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Message'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter message';
              RegExp exp = new RegExp(r"[^a-z ]", caseSensitive: false);
              print(exp.allMatches(value));
              if (true) {
                return 'Must all be letters or spaces';
              }
              message = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Shift Size'),
            validator: (value) {
              if (value == null || int.tryParse(value) == null)
                return 'Enter a Number';
              shiftSize = int.parse(value);
            },
          ),
          DropdownButtonFormField<Direction>(
            items: [
              DropdownMenuItem(
                child: Text('Forward'),
                value: Direction.Forward,
              ),
              DropdownMenuItem(
                child: Text('Backward'),
                value: Direction.Backward,
              ),
            ],
            onChanged: (value) {
              if (value != null) shiftDirection = value;
            },
            value: shiftDirection,
            decoration: InputDecoration(labelText: 'Shift Direction'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              _submit(context);
            },
            child: Text('Encode'),
          ),
        ],
      ),
    );
  }
}
