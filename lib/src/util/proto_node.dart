import 'package:command_line_interface/command_line_interface.dart';

abstract class ProtoNode extends CLINode {
  List<CommandNode> nodes = [];

  interpret(String s) async {
    ///the opinion is that
    if (!(await letNodesInterpret(s)) || s.isEmpty) {
      loadScreen();
    }
  }

  listenToChange(String s) {}

  Future<bool> letNodesInterpret(String s) async {
    for (CommandNode node in nodes) {
      if (node.isValidInput(s)) {
        return await node.interpret(s);
      }
    }
    return false;
  }

  void add(CommandNode node) {
    node.getAdopted(this);
    for (CommandNode i in node.nodes) {
      i.getAdopted(this);
    }
    nodes.add(node);
  }

  void loadScreen() {}

  bool get isActiveScope => scope.isActive(interpret);
  // releaseScope(){
  //   scope.release(interpret);
  // }
  requestScope() {
    _releaseScope = scope.request(interpret, changeListener: listenToChange);
  }

  Function? _releaseScope;

  releaseScope() {
    if (_releaseScope != null) {
      releaseScope();
      dropText = ""; //empty str calls loadScreen of next in queue
      _releaseScope = null;
    }
  }
}
