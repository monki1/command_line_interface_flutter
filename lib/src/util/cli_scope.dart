class CLIScope {
  // CLIController controller;
  // Function(Function(String))? removeListener;
  //get the text editing controller
  final Function(String) _rootInterpreter;
  final Function(String)? _rootListener;
  // final List<List<Function(String)>> _suscribers = [];
  final List<String> _subscriberIds = [];
  final Map<String, List<Function(String)>> _subscribersMap = {};

  bool Function(String)? _topListener;
  bool Function(String)? _topInterpreter;

  CLIScope(this._rootInterpreter, {Function(String)? rootListener})
      : _rootListener = rootListener;

  setTop(
    // / top functions :[@param topInterpreter]: the function that will be called when the input is recieved
    ///   if the function returns true, then the input is consumed and no other function will recieve the input
    /// @param topChangeListener: the function that will be called when the input is recieved
    /// are the first to recieve the input
    ///   to stop the input from being passed down to the next layer
    ///  return true
      {bool Function(String)? topInterpreter, bool Function(String)? topChangeListener}) {
    _topInterpreter = topInterpreter;
    _topListener = topChangeListener;
  }

  Function request(Function(String) interpreter, {Function(String)? changeListener, String? id ///id should be unique, used to identify the subscriber layer.
  ///this function returns a function releases this subscriber layer 
  }) {
    id = id?? DateTime.now().millisecondsSinceEpoch.toString();
    ///requests the interpreter to be the active interpreter
    List<Function(String)> input = [interpreter]+(changeListener!=null?[changeListener]:[]);
    _subscribersMap[id] = input;
    _subscriberIds.insert(0, id);
    // _suscribers.insert(0, input);
    return (){
      // release(interpreter, changeListener: changeListener);
      releaseSubscriberWithId(id!);
    };
  }

  releaseActive() {
    ///releases the active interpreter
    if (_subscriberIds.isNotEmpty) {
      // _suscribers.removeAt(0);
      String id = _subscriberIds[0];
      _subscriberIds.removeAt(0);
      _subscribersMap.remove(id);
    }
  }

  releaseSubscriberWithId(String id){
    if(_subscriberIds.contains(id)){
      _subscriberIds.remove(id);
      _subscribersMap.remove(id);
    }
  }

  interpret(String s) {
    ///conntect this to incoming text onSubmit
    ///entry point for the input
    if (_topInterpreter != null) {
      if (_topInterpreter!(s)) {
        ///if the top interpreter returns true, then the input is consumed
        return;
      }
    }
    if (_subscriberIds.isNotEmpty) {
      _subscribersMap[_subscriberIds[0]]![0](s);
      /// ^ if there is no subscriber
    } else {
      _rootInterpreter(s);
    }
  }

  listenToChange(String s) {
    ///optional: connect this to incoming text onChange
    if (_topListener != null) {
      if (_topListener!(s)) {
        ///if the top listener returns true, then the input is consumed
        return;
      }
    }
    if (_subscriberIds.isNotEmpty) {

      int k = 0;
    bool foundListener = false;

    while (k < _subscriberIds.length && !foundListener) {
      String id = _subscriberIds[k];
      List<Function(String)> layer = _subscribersMap[id]!;
      if (layer.length == 2) {
        foundListener = true;
        layer[1](s);
      }
      k++;
    }

    } else {
      _rootListener!(s);
    }














  }

  bool isActive(Function(String) interpreter) {
    ///checks if the interpreter is the active interpreter
    if (_subscriberIds.isNotEmpty) {
      return _subscribersMap[_subscriberIds[0]]![0] == interpreter;

    }
    return false;
    
  }
}
