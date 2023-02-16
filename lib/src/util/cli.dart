import 'package:command_line_interface/command_line_interface.dart';

abstract class CLI extends ProtoNode {
  Function? releaseParentScope;

  // CLI({ required super.controller ,required super.scope}) {
  // }
  // CLI.newScope({required super.controller}) {
  //   scope = CLIScope(interpret, changeListener: listenToChange);
  // }

  CLI({required controller_, required CLIScope scope_}) {
    controller = controller_;
    scope = scope_;
  }
  CLI.withScope({required controller_}) {
    controller = controller_;
    scope = CLIScope(
        rootSubmitListener: interpret, rootChangeListener: listenToChange);
  }
}
