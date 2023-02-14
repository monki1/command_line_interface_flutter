
import 'package:command_line_interface/command_line_interface.dart';

abstract class ProtoNode extends CLINode {
  List<CommandNode> nodes = [];

  Function(String)? listenToChange;
  interpret(String s) async {
    if(!(await letNodesInterpret(s)) || s.isEmpty){
      loadScreen();
    }
  }

  Future<bool> letNodesInterpret(String s) async {
    for(CommandNode node in nodes){
      if(node.isValidInput(s)){
        return await node.interpret(s);
      }
    }
    return false;
  }

  void add(CommandNode node){
    node.getAdopted(this);
    for(CommandNode i in node.nodes){
      i.getAdopted(this);
    }
    nodes.add(node);
  }

  void loadScreen(){}

  bool get isActiveScope => scope.isActive(interpret);
  // releaseScope(){
  //   scope.release(interpret);
  // }
  requestScope(){
    scope.request(interpret, changeListener: listenToChange);
  }
  





}

