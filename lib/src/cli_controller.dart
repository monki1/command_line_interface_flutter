//takes in two controller
//set interpreter
// get widget

import 'package:command_line_interface/src/ui_controller/cli_listview/cli_listview_controller.dart';
import 'package:command_line_interface/src/ui_controller/cli_screen/cli_screen_controller.dart';
import 'package:command_line_interface/src/ui_controller/cli_textfield/cli_textfield_controller.dart';
import 'package:flutter/cupertino.dart';


class CLIController{
  final CLITextFieldController input;
  final CLIListViewController display;
  final CLIScreenController screen;
  late Widget? _widget=null;
  CLIController({Function(String)? interpreter ,CLITextFieldController? textFieldController, CLIListViewController? displayController, CLIScreenController? screenController})
      :input = textFieldController ?? CLITextFieldController(),
        display = displayController ?? CLIListViewController(),
    screen = screenController ?? CLIScreenController();


  Widget get widget {
    print(_widget);
    if(_widget==null){
      _initializeWidget();
    }
    return _widget!;
  }
  _initializeWidget(){
    screen.content = [display.widget, input.widget];
    _widget = screen.widget;
  }





}