//takes in two controller
//set interpreter
// get widget

import 'package:flutter/cupertino.dart';

import 'cli_listview/cli_listview_controller.dart';
import 'cli_textfield/cli_textfield_controller.dart';


class CLIController{
  final CLITextFieldController inputController;
  final CLIListViewController displayController;
  CLIController({Function(String)? interpreter ,CLITextFieldController? textFieldController, CLIListViewController? displayController})
      :inputController = textFieldController ?? CLITextFieldController(),
        displayController = displayController ?? CLIListViewController();
  Widget get widget => Flex(
      direction: Axis.vertical,
      children: [
        Expanded(child: displayController.widget),
        inputController.widget,
      ]
  );





}