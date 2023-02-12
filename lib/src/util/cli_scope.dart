class CLIScope{
  Function(String) _root_interpreter;
  Function(String)? _active_interpreter;
  CLIScope(this._root_interpreter);
  request(Function(String) interpreter){
    _active_interpreter = interpreter;
  }
  release(){
    _active_interpreter = null;
  }
  interpret(String s){
    if(_active_interpreter!=null){
      _active_interpreter!(s);
    }else{
      _root_interpreter(s);
    }
  }
}