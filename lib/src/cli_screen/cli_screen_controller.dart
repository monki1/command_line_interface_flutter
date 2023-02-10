
//the entire screen is a column built with a streambuilder from a behavior subject of a list of widgets
//the list of widgets is the content of the screen
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CLIScreenController{
  final BehaviorSubject<List<Widget>> _subject= BehaviorSubject<List<Widget>>.seeded([]);
  List<Widget> _content=[];
  List<Widget> get content => _content;
  late Widget? _widget = null;
  set content(List<Widget> content){
    _content = content;
    _subject.add(_content);
  }
  Widget getWidget() {
    return
    StreamBuilder<List<Widget>>(
      stream: _subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Flex(
            direction: Axis.vertical,
            children: snapshot.data!,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

    get widget{
    if(_widget == null){
      _widget = getWidget();
    }
    return _widget;
  }


  //
}