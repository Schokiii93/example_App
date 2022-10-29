import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  //Den ButtonText geben wir als Variable rein
  //Zur Wiederverwendung
  final String buttonText;
  final Function callback;
  const GlobalButton(
      {super.key, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    //ThemeData holen
    final themeData = Theme.of(context);
    return InkResponse(
      //Funktin für Button Klick
      onTap: () => callback(),
      child: Material(
        elevation: 20,
        child: Container(
          height: 50,
          //Maximale Bildschirmbreite
          width: 150,
          //Sekundärfarben verwenden
          decoration: BoxDecoration(
              color: themeData.colorScheme.secondary,
              borderRadius: BorderRadius.circular(10)),

          //Text innerhalb des Buttons
          child: Center(
            child: Text(
              buttonText,
              //das ! setzten, da der Style da sein muss (könnte ja auch null sein)
              style: themeData.textTheme.headline1!.copyWith(
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
