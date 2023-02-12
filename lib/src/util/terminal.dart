
import 'package:command_line_interface/src/util/terminal_scope.dart';

import '../../command_line_interface.dart';
import 'command_node.dart';

abstract class Terminal {
  List<CommandNode> nodes = [];
  CLIController cli;
  late TerminalScope scope;

  Terminal(this.cli) {
    scope = TerminalScope(interpret);
    cli.inputController.onSubmit.listen(scope.interpret);
  }


  void interpret(String s){
    if(!letNodesInterpret(s)){
      rootScreen();
    }
  }



  void add(CommandNode node){
    node.cli = cli;
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






















