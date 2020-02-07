import 'package:dynamictheme/blocs/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: HomePage(),
      theme: theme.getTheme(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Theme"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Dark Theme"),
              onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
            ),
            FlatButton(
              child: Text("Light Theme"),
              onPressed: () => _themeChanger.setTheme(ThemeData.light()),
            ),
          ],
        ),
      )
    );
  }
}
