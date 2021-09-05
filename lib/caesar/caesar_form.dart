import 'package:ciphers/models/good_functions.dart';
import 'package:flutter/material.dart';

import '../models/enums.dart';

class CaesarForm extends StatelessWidget with GoodFunctions {
  final _formKey = GlobalKey<FormState>();
  String message = '';
  int? shiftSize;
  Direction shiftDirection = Direction.Forward;

  Widget _showCodedMessage() {
    return Text(caesarEncode(
      originalMessage: formatMessage(message.toUpperCase()),
      shift: shiftSize!,
      direction: shiftDirection,
    ));
  }

  String caesarEncode({
    required String originalMessage,
    required int shift,
    required Direction direction,
  }) {
    print('originalMessage before CaesarEncode: $originalMessage');
    String newMessage = '';
    for (int i = 0; i < originalMessage.length; i++) {
      if (isLetter(originalMessage[i])) {
        newMessage += encodeChar(
          initialIndex: convertToIndex(originalMessage[i]),
          shift: shift,
          direction: direction,
        );
      } else
        newMessage += ' ';
    }
    return newMessage;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState == null || !_formKey.currentState!.validate())
      return;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Code'),
          content: _showCodedMessage(),
          actions: [
            TextButton(
              child: Text('Noice'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
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
