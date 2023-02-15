import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import 'cli_textfield_factory.dart';

class CLITextFieldController {
  /// [streams] onChange, onSubmit
  /// [functions] addTextToField
  /// [get] widget, textEditingController, focusNode
  final BehaviorSubject<String> onChange;
  final BehaviorSubject<String> onSubmit;
  Widget? _widget;
  InputDecoration? inputDecoration;
  TextEditingController textEditingController;
  TextStyle? textStyle;
  final FocusNode focusNode;
  TextInputType _keyboardType = TextInputType.text;
  set keyboardType(TextInputType type) {
    _keyboardType = type;
  }

  CLITextFieldController({this.inputDecoration})
      : onChange = BehaviorSubject<String>(),
        onSubmit = BehaviorSubject<String>(),
        // _autoFillStream = BehaviorSubject<String>(),
        textEditingController = TextEditingController(),
        focusNode = FocusNode();

  void addTextToField(String s) {
    textEditingController.text = s;
    moveInesertionPoint(textEditingController.text.length);
  }

  void moveInesertionPoint(int i) {
    textEditingController.selection =
        TextSelection.fromPosition(TextPosition(offset: i));
  }

  //behavior subject replaceMap

  Widget get widget {
    if (_widget == null) {
      return newWidget;
    }
    return _widget!;
  }

  Widget get newWidget {
    _widget = cliTextFieldFactory(
        onChange, onSubmit, textEditingController, focusNode, _keyboardType,
        textStyle: textStyle, decoration: inputDecoration);
    // }
    return _widget!;
  }
}

  //get widget
