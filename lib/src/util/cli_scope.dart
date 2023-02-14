class CLIScope {
  // CLIController controller;
  // Function(Function(String))? removeListener;
  //get the text editing controller
  final Function(String) _rootInterpreter;
  final Function(String)? _rootListener;
  final List<List<Function(String)>> _suscribers = [];
  bool Function(String)? _topListener;
  bool Function(String)? _topInterpreter;

  CLIScope(this._rootInterpreter, {Function(String)? rootListener})
      : _rootListener = rootListener;

  setTop(
      {bool Function(String)? interpreter, bool Function(String)? changeListener}) {
    _topInterpreter = interpreter;
    _topListener = changeListener;
  }

  Function request(Function(String) interpreter, {Function(String)? changeListener}) {
    ///requests the interpreter to be the active interpreter
    List<Function(String)> input = [interpreter]+(changeListener!=null?[changeListener]:[]);
    _suscribers.insert(0, input);
    return (){
      release(interpreter, changeListener: changeListener);
    };
  }

  release(Function(String) interpreter, {Function(String)? changeListener}) {
    List<Function(String)> input = [interpreter]+(changeListener!=null?[changeListener]:[]);
    _suscribers.remove(input);
  }

  

  interpret(String s) {
    ///conntect this to incoming text onSubmit
    ///entry point for the input
    if (_topInterpreter != null) {
      if (_topInterpreter!(s)) {
        ///if the top interpreter returns false, then the input is consumed
        return;
      }
    }
    if (_suscribers.isNotEmpty) {
      _suscribers[0][0](s);




    } else {
      _rootInterpreter(s);
    }
  }

  listenToChange(String s) {
    ///optional: connect this to incoming text onChange
    if (_topListener != null) {
      if (_topListener!(s)) {
        ///if the top listener returns false, then the input is consumed
        return;
      }
    }
    if (_suscribers.isNotEmpty) {

      //for i, if the item.length==2 then 
      for (int i = 0; i < _suscribers.length; i++) {
        if(_suscribers[i].length==2){
          _suscribers[i][1](s);
        }
      }
    } else {
      _rootListener!(s);
    }
  }

  bool isActive(Function(String) interpreter) {
    ///checks if the interpreter is the active interpreter
    if (_suscribers.isNotEmpty) {
      return _suscribers[0][0] == interpreter;
    }
    return false;
    
  }
}
