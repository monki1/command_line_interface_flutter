import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';


abstract class CLINode {
  late CLIController controller;
  late CLIScope scope;

  getAdopted(CLINode node){
    controller = node.controller;
    scope = node.scope;
  }
  set dropText(String s){
    controller.input.textEditingController.text = s;
    moveInsertionPoint =controller.input.textEditingController.text.length;
  }
  set moveInsertionPoint(int i){
    controller.input.textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: i));
  }
}

abstract class FunctionNode extends CLINode{




}




