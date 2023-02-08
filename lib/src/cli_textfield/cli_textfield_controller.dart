


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
  // final BehaviorSubject <String> _autoFillStream;
  final InputDecoration _decoration;
  //TODO
  //hintStream
  //keyboardTypeStream
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType _keyboardType = TextInputType.text;

  CLITextFieldController({InputDecoration decoration = cliDefaultTextDecoration})
      : onChange = BehaviorSubject<String>(),
        onSubmit = BehaviorSubject<String>(),
        // _autoFillStream = BehaviorSubject<String>(),
        textEditingController = TextEditingController(),
        focusNode = FocusNode()
        ,_decoration = decoration;
    // _autoFillStream.listen(addTextToField);


  void addTextToField(String s) {
    textEditingController.text = s;
    ///move cursor to end
    textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: textEditingController.text.length)
    );
  }

  //behavior subject replaceMap


  Widget get widget{
    return cliTextFieldFactory(onChange, onSubmit, textEditingController, focusNode, _decoration, _keyboardType);
  }

}

  //get widget
