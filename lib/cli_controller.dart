//takes in two controller
//set interpreter
// get widget

import 'package:command_line_interface/cli_listview/cli_listview_controller.dart';
import 'package:flutter/cupertino.dart';

import 'cli_textfield/cli_textfield_controller.dart';

class CLIController{
  final CLITextFieldController textFieldController;
  final CLIListViewController displayController;
  CLIController({CLITextFieldController? textFieldController, CLIListViewController? displayController})
      : textFieldController = textFieldController ?? CLITextFieldController(),
        displayController = displayController ?? CLIListViewController();
  Widget get widget => Flex(
      direction: Axis.vertical,
      children: [
        Expanded(child: displayController.widget),
        textFieldController.widget,
      ]
  );





}