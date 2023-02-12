import 'package:command_line_interface/src/util/cli_scope.dart';
import 'package:flutter/cupertino.dart';

import '../../command_line_interface.dart';
abstract class CLINode {
  late CLIController controller;
  late CLIScope scope;
  adopt(CLINode node){
    node.getAdopted(this);
  }
  getAdopted(CLINode node){
    controller = node.controller;
    scope = node.scope;
  }
  set dropText(String s){
    controller.input.textEditingController.text = s;
    inputCursor =controller.input.textEditingController.text.length;
  }
  set inputCursor(int i){
    controller.input.textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: i));
  }
}

abstract class CommandNode  extends CLINode{


  Future<bool> interpret(String s);
  bool isValidInput(String s);
  @override
  adopt(CLINode node) {
    if(node is FunctionNode){
      node._commandInterpreter = interpret;
    }
    super.adopt(node);
  }

}

abstract class FunctionNode extends CLINode{
  Function(String)? _commandInterpreter;

  bool requestScope(){
    if(_commandInterpreter != null) {
      scope.request(_commandInterpreter!);
    }
    return _commandInterpreter == null;
  }



}




