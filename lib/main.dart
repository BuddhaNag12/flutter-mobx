import 'package:flutter/material.dart';
import 'package:flutter_state/screens/homeScreen.dart';
import 'package:flutter_state/store/globalStore.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<GlobalStore>(
      create: (_) => GlobalStore(),
      child: MaterialApp(
          title: 'PokeDex',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'HindVadodara',
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: 'HindVadodara',
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
              caption: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 15,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'HindVadodara'),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(
                  title: 'Home',
                )
          }),
    );
  }
}
