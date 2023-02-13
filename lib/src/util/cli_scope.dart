


class CLIScope{
  // CLIController controller;
  // Function(Function(String))? removeListener;
  //get the text editing controller
  final Function(String) _rootInterpreter;
  Function(String)? _rootListener;
  Function(String)? _activeInterpreter;
  Function(String)? _activeListener;
  bool Function(String)? _topListener;
  bool Function(String)? _topInterpreter;



  CLIScope(this._rootInterpreter,{Function(String)? rootListener}):
        _rootListener = rootListener;
        
  setTop({bool Function(String)? interpreter, bool Function(String)? listener}){
    _topInterpreter = interpreter;
    _topListener = listener;
  }

  request(Function(String) interpreter, {Function(String)? listener}){
    ///requests the interpreter to be the active interpreter
    if(_activeInterpreter!=null ||_activeListener!=null){
      release();
    }
    _activeInterpreter = interpreter;
    _activeListener = listener;
  }

  release(){
    _activeInterpreter = null;
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
    if(_topListener!=null){
      if(_topListener!(s)){return;}
    }
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