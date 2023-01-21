
import 'package:flutter/material.dart';


ThemeData defaultTheme = ThemeData.dark();

StatelessWidget quickAppGenerator(Widget cliWidget,
    { ThemeData? theme}) {
  return QuickApp(cliWidget: cliWidget, theme: theme??defaultTheme);
}

class QuickApp extends StatelessWidget {
  Widget cliWidget;
  ThemeData theme;

  QuickApp({Key? key, required this.cliWidget, required this.theme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: QuickPage(cliWidget: cliWidget
      ),
    );
  }
}

class QuickPage extends StatelessWidget {
  Widget cliWidget;
  // String title;
  QuickPage({Key? key, required this.cliWidget
    // , required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: SafeArea(child: cliWidget),
    );
  }
}



