


import '../../command_line_interface.dart';

abstract class CLI {
  List<CommandNode> nodes = [];
  CLIController controller;
  late CLIScope scope;

  CLI(this.controller) {
    scope = CLIScope(interpret);
    controller.inputController.onSubmit.listen(scope.interpret);
  }


  void interpret(String s){
    if(!letNodesInterpret(s)){
      rootScreen();
    }
  }



  void add(CommandNode node){
    node.cli = controller;
    node.scope = scope;
    nodes.add(node);
  }

  bool letNodesInterpret(String s){
    for(CommandNode node in nodes){
      if(node.isValidInput(s)){
        return node.interpret(s);
      }
    }
    return false;
  }

  void rootScreen();



}






















