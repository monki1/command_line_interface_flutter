import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_app_generator/quick_app_generator.dart';

CLIController cc = CLIController();

Function(String) interpreter = (String s) {
  ///set displayController.content to update the display
  cc.display.content = cc.display.content + [Text(s)];
};

main(){
  /// listen to [onSubmit] of [inputController] to interpret the input
  cc.input.onSubmit.listen(
    ///put your [interpreter] here
    interpreter
    );
  runApp(
      quickAppGenerator(
        ///get [widget] from [CLIController]
          cc.widget,
      )
  );
}