


import 'package:command_line_interface/command_line_interface.dart';




abstract class CLI extends CLINode{
  // late CLIController controller;
  // late CLIScope scope;
  List<CommandNode> nodes = [];
  bool Function(String)? _topInterpreter;
  bool Function(String)? _topListener;



  CLI(CLIController controller_){
    controller = controller_;
    scope = CLIScope(interpret, rootListener: listen);
    scope.setTop(interpreter: _topInterpreter, listener: _topListener);

  }


  interpret(String s) async {
    if(!(await letNodesInterpret(s)) || s.isEmpty){
      rootScreen();
    }
  }

  listen(String s) async {
  
  }

  



  void add(CommandNode node){
    adopt(node);
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

}






















