import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';

abstract class CLINode {
  late CLIController controller;
  late CLIScope scope;
  CLINode();

  getAdopted(CLINode node_) {
    controller = node_.controller;
    scope = node_.scope;
  }

  set dropText(String s) {
    controller.input.textEditingController.text =
        s; //set the text in text field
    moveInsertionPoint = controller.input.textEditingController.text
        .length; // text insertion point moved to the end
    controller.input.focusNode
        .requestFocus(); //this is to make sure the focus is on the input
  }

  set moveInsertionPoint(int i) {
    controller.input.textEditingController.selection =
        TextSelection.fromPosition(TextPosition(offset: i));
  }

  scrollDown() {
    controller.display.scrollController.animateTo(
      controller.display.scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  scrollUp() {
    controller.display.scrollController.animateTo(
      controller.display.scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
