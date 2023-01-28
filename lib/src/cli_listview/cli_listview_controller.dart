import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'cli_listview_factory.dart';



class CLIListViewController {
  /// set [content] takes in [List]of[Widget] and adds it to screen (first on top, last on bottom)
  /// get [content] returns [List]of[Widget]the current content of the screen
  /// get [widget] returns the [ListView] widget
  /// get [scrollController] returns [ScrollController] the scroll controller for the ListView
  final BehaviorSubject<List<Widget>> _subject;
  List<Widget> _content=[];
  final ScrollController _scrollController = ScrollController();
  CLIListViewController(): _subject = BehaviorSubject<List<Widget>>.seeded([]);
  // Stream<List<Widget>> get stream => _subject.stream;

  set content(List<Widget> content){
    _content = content;
    _subject.add(_content);
  }
  List<Widget> get content => _content;

  get widget => cliListViewFactory(_subject.stream, _scrollController);
  ScrollController get scrollController => _scrollController;

}
