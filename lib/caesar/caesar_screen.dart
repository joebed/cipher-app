import 'package:ciphers/caesar/caesar_form.dart';
import 'package:ciphers/models/enums.dart';
import 'package:flutter/material.dart';

class CaesarScreen extends StatelessWidget {
  const CaesarScreen({Key? key}) : super(key: key);
  static const routeName = '/caesar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caesar Cipher'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CaesarForm(),
                ),
              ),
              SizedBox(height: 16),
              Text('Bottom Text'),
            ],
          ),
        ),
      ),
    );
  }
}
