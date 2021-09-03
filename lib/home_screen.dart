import 'package:ciphers/caesar/caesar_screen.dart';
import 'package:flutter/material.dart';

class CipherButton extends StatelessWidget {
  final String cipher;
  final String route;
  CipherButton(this.cipher, this.route);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Text(
        cipher,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Choose Your Character',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                children: [
                  CipherButton('Caesar', CaesarScreen.routeName),
                  CipherButton('Affine', CaesarScreen.routeName),
                  CipherButton('Vigenere', CaesarScreen.routeName),
                  CipherButton('Hill', CaesarScreen.routeName),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
