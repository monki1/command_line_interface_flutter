


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import 'cli_textfield_factory.dart';
import 'default_input_decoration.dart';

class CLITextFieldController {

  /// [streams] onChange, onSubmit
  /// [functions] addTextToField
  /// [get] widget, textEditingController, focusNode
  final BehaviorSubject <String> onChange;
  final BehaviorSubject <String> onSubmit;
  Widget? _widget;
  // final BehaviorSubject <String> _autoFillStream;
  InputDecoration inputDecoration;

  //TODO
  //hintStream
  //keyboardTypeStream
  TextEditingController textEditingController;
  TextStyle? textStyle;
  final FocusNode focusNode;
  TextInputType _keyboardType = TextInputType.text;
  set keyboardType(TextInputType type){
    _keyboardType = type;
  }

  CLITextFieldController({InputDecoration decoration = cliDefaultTextDecoration})
      : onChange = BehaviorSubject<String>(),
        onSubmit = BehaviorSubject<String>(),
        // _autoFillStream = BehaviorSubject<String>(),
        textEditingController = TextEditingController(
        ),
        focusNode = FocusNode()
        ,inputDecoration = decoration;
    // _autoFillStream.listen(addTextToField);


  void addTextToField(String s) {
    textEditingController.text = s;
    ///move cursor to end
    textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: textEditingController.text.length)
    );
  }

  //behavior subject replaceMap

  Widget get widget {
    if (_widget == null) {
       return newWidget;
    }
    return _widget!;
  }

  Widget get newWidget{
    // if (_widget == null) {
      _widget = cliTextFieldFactory(
          onChange, onSubmit,
          textEditingController,
          focusNode, inputDecoration,
          _keyboardType, textStyle: textStyle);
    // }
    return _widget!;

  }

}

  //get widget
