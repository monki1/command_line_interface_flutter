class CLIScope{
  final Function(String) _rootInterpreter;
  Function(String)? _activeInterpreter;



  ///sets off before the active interpreter
  bool Function(String)? _topInterpreter;
  set top(bool Function(String) interpreter){
    _topInterpreter = interpreter;
  }

  CLIScope(this._rootInterpreter);
  request(Function(String) interpreter){
    _activeInterpreter = interpreter;
  }
  release(){
    _activeInterpreter = null;
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

  bool isActive(Function(String) interpreter){
    ///checks if the interpreter is the active interpreter
    if(_activeInterpreter==null){
      return _rootInterpreter == interpreter;
    }
    return _activeInterpreter == interpreter;
  }
}