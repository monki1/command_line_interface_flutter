import 'package:command_line_interface/command_line_interface.dart';

abstract class CommandNode  extends ProtoNode{
  
  bool isValidInput(String s);

}