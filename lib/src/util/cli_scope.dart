class CLIScope{
  final Function(String) _rootInterpreter;
  Function(String)? _rootListener;
  Function(String)? _activeInterpreter;
  Function(String)? _activeListener;



  ///sets off before the active interpreter
  bool Function(String)? _topInterpreter;
  setTop(bool Function(String) interpreter, {Function(String)? listener}){
    _topInterpreter = interpreter;
    _rootListener = listener;
  }

  CLIScope(this._rootInterpreter);
  request(Function(String) interpreter, {Function(String)? listener}){
    setTop(interpreter, listener: listener);
  }
  release(){
    _activeInterpreter = null;
    controller.input.textEditingController.removeListener(_activeListener!);
    _activeListener = null;
  }
  interpret(String s){
    ///entry point for the input
    if(_topInterpreter!=null){
      if(_topInterpreter!(s)){
        ///if the top interpreter returns true, then the input is consumed
        return;
      }
    }
    if(_activeInterpreter!=null){
      _activeInterpreter!(s);
    }else{
      _rootInterpreter(s);
    }
  }
  listen(String s){
    _topListener!(s);
    if(_activeListener!=null){
      _activeListener!(s);
    }else{
      _rootListener!(s);
    }
  }

  bool isActive(Function(String) interpreter){
    ///checks if the interpreter is the active interpreter
    if(_activeInterpreter==null){
      return _rootInterpreter == interpreter;
    }
    return _activeInterpreter == interpreter;
  }
}