import 'package:color_combination/ThemeProvider/themeChanger.dart';
import 'package:color_combination/secondPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: MyFirstPage(),
          );
        },
      ),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    bool _hasBeenPressed = false;

    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Color Combination"),
        ),
        body: Column(
          children: <Widget>[
            RadioListTile<ThemeMode>(
              title: const Text('Light Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.light,
              onChanged: themeChanger.setTheme,
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.dark,
              onChanged: themeChanger.setTheme,
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage()));                    },
              child: Text("First BTN"),
            )
          ],
        ));


  }
}
