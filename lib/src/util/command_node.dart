import 'package:command_line_interface/command_line_interface.dart';

abstract class CommandNode extends ProtoNode {
  ProtoNode? parent;
  bool isValidInput(String s);

  @override
  getAdopted(CLINode node_) {
    if (node_ is ProtoNode) {
      parent = node_;
    }

    for (CommandNode cn in nodes) {
      cn.getAdopted(this);
    }
  }
}
