import 'package:command_line_interface/src/util/cli_scope.dart';

import '../../command_line_interface.dart';
abstract class CLINode {
  late CLIController cli;
  late CLIScope scope;
  adopt(CLINode node){
    node.getAdopted(this);
  }
  getAdopted(CLINode node){
    cli = node.cli;
    scope = node.scope;
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
  late Function(String) _commandInterpreter;

}




