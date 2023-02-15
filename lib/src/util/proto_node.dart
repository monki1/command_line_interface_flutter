import 'package:command_line_interface/command_line_interface.dart';

abstract class ProtoNode extends CLINode {
  List<CommandNode> nodes = [];

  interpret(String s) async {
    if (!(await letNodesInterpret(s)) || s.isEmpty) {
      loadDefaultScreen();
    }
  }

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
    nodes.add(node);
  }

  listenToChange(String s) {}
  void loadDefaultScreen() {}
  void prepareEmptyScreen() {}

  bool get isActiveScope => scope.isActive(interpret);
  // releaseScope(){
  //   scope.release(interpret);
  // }
  requestScope() {
    if (_releaseScope != null) {
      releaseScope();
    }

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
