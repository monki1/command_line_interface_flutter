import 'package:command_line_interface/command_line_interface.dart';

abstract class CLI extends ProtoNode {
  Function? releaseParentScope;

  CLI(CLIController controller_) {
    controller = controller_;
    scope = CLIScope(interpret, rootListener: listenToChange);
  }
}
