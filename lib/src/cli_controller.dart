//takes in two controller
//set interpreter
// get widget

import 'package:flutter/cupertino.dart';

import 'cli_listview/cli_listview_controller.dart';
import 'cli_screen/cli_screen_controller.dart';
import 'cli_textfield/cli_textfield_controller.dart';


class CLIController{
  final CLITextFieldController inputController;
  final CLIListViewController displayController;
  final CLIScreenController screenController;
  late Widget? _widget=null;
  CLIController({Function(String)? interpreter ,CLITextFieldController? textFieldController, CLIListViewController? displayController, CLIScreenController? screenController})
      :inputController = textFieldController ?? CLITextFieldController(),
        displayController = displayController ?? CLIListViewController(),
    screenController = screenController ?? CLIScreenController();


  Widget get widget {
    print(_widget);
    if(_widget==null){
      _initializeWidget();
    }
    return _widget!;
  }
  _initializeWidget(){
    screenController.content = [displayController.widget, inputController.widget];
    _widget = screenController.widget;
  }





}