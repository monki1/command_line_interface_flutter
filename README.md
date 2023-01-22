# command_line_interface

Add this to `pubspec.yaml`
```yaml
  command_line_interface:
    git:
      url: https://github.com/monki1/command_line_interface_flutter.git
      ref: main
```


### A CLIController has
- a inputController [ CLITextFieldController ]
- a displayController [ CLIListViewController ]

```dart

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
```



```dart
class CLIController{
  final CLITextFieldController inputController;
  final CLIListViewController displayController;
```

```dart
class CLIListViewController {
  /// set [content] takes in [List]of[Widget] and adds it to screen (first on top, last on bottom)
  /// get [content] returns [List]of[Widget]the current content of the screen
  /// get [widget] returns the [ListView] widget
  /// get [scrollController] returns [ScrollController] the scroll controller for the ListView
```
```dart
class CLITextFieldController {
  /// get [Stream<String>] onChange, onSubmit
  /// [functions] addTextToField
  /// [get] widget, textEditingController, focusNode
```# flutter_quick_app_generator
