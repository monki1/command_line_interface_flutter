import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'cli_listview_factory.dart';

class CLIListViewController {
  /// set [content] takes in List<Widget> and adds it to screen (first on top, last on bottom)
  /// get [content] returns List<Widget>the current content of the screen
  /// get [widget] returns the [ListView] widget
  /// get [newWidget] returns a new [ListView] built from the current scrollController and other relevant data
  /// get/set [scrollController] => [ScrollController] the scroll controller for the ListView
  final BehaviorSubject<List<Widget>> _subject;
  List<Widget> _content = [];
  Widget? _widget;
  ScrollController scrollController = ScrollController();
  CLIListViewController() : _subject = BehaviorSubject<List<Widget>>.seeded([]);

  // Stream<List<Widget>> get stream => _subject.stream;

  set content(List<Widget> content) {
    _content = content;
    _subject.add(_content);
  }

  List<Widget> get content => _content;

  // Widget get widget => Expanded(child:  cliListViewFactory(_subject.stream, _scrollController));
  // ScrollController get scrollController => _scrollController;

  Widget get widget {
    if (_widget == null) {
      return newWidget;
    }
    return _widget!;
  }

  Widget get newWidget {
    // if (_widget == null) {
    _widget =
        Expanded(child: cliListViewFactory(_subject.stream, scrollController));
    // }
    return _widget!;
  }
}
