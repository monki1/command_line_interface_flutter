//takes in two controller
//set interpreter
// get widget

import 'package:command_line_interface/src/ui_controller/cli_listview/cli_listview_controller.dart';
import 'package:command_line_interface/src/ui_controller/cli_screen/cli_screen_controller.dart';
import 'package:command_line_interface/src/ui_controller/cli_textfield/cli_textfield_controller.dart';

class CLIController {
  final CLITextFieldController input;
  final CLIListViewController display;
  final CLIScreenController screen;

  CLIController(
      {Function(String)? interpreter,
      CLITextFieldController? textFieldController,
      CLIListViewController? displayController,
      CLIScreenController? screenController})
      : input = textFieldController ?? CLITextFieldController(),
        display = displayController ?? CLIListViewController(),
        screen = screenController ?? CLIScreenController();
}
