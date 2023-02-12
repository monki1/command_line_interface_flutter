


import '../../command_line_interface.dart';

abstract class CLI {
  List<CommandNode> nodes = [];
  CLIController controller;
  late CLIScope scope;

  CLI(this.controller) {
    scope = CLIScope(interpret);
    controller.input.onSubmit.listen(scope.interpret);
  }


  interpret(String s) async {
    if(!await letNodesInterpret(s)){
      rootScreen();
    }
  }



  void add(CommandNode node){
    node.cli = controller;
    node.scope = scope;
    nodes.add(node);
  }

  Future<bool> letNodesInterpret(String s) async {
    for(CommandNode node in nodes){
      if(node.isValidInput(s)){
        return await node.interpret(s);
      }
    }
    return false;
  }

  void rootScreen();

  void adopt(CommandNode node){

    nodes.add(node);
  }



}






















