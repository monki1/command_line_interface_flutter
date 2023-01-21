import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';

import 'quick_app_generator.dart';

CLIController cc = CLIController();

Function(String) interpreter = (String s) {
  ///update displayController.content to update the display
  cc.displayController.content = [
    ...cc.displayController.content,
    Text(s),
  ];
};

main(){
  /// listen to [onSubmit] of [inputController] to interpret the input
  cc.inputController.onSubmit.listen(
    ///put your [interpreter] here
    interpreter
    );
  runApp(
      quickAppGenerator(
          cc.widget,
      )
  );
}