class CLIScope {
  // CLIController controller;
  // Function(Function(String))? removeListener;
  //get the text editing controller
  final Function(String) _rootSubmitListener;
  final Function(String)? _rootListener;
  // final List<List<Function(String)>> _suscribers = [];
  final List<String> _subscriberIds = [];
  final Map<String, List<Function(String)>> _subscribersMap = {};

  bool Function(String)? _topChangeListener;
  bool Function(String)? _topSubmitListener;

  CLIScope(this._rootSubmitListener, {Function(String)? rootListener})
      : _rootListener = rootListener;

  setTop(
      // / top functions :[@param topSubmitListener]: the function that will be called when the input is recieved
      ///   if the function returns true, then the input is consumed and no other function will recieve the input
      /// @param topChangeListener: the function that will be called when the input is recieved
      /// are the first to recieve the input
      ///   to stop the input from being passed down to the next layer
      ///  return true
      {bool Function(String)? topSubmitLisener,
      bool Function(String)? topChangeListener}) {
    _topSubmitListener = topSubmitLisener;
    _topChangeListener = topChangeListener;
  }

  Function request(Function(String) submitListener,
      {Function(String)? changeListener, String? id

      ///id should be unique, used to identify the subscriber layer.
      ///this function returns a function releases this subscriber layer
      }) {
    id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

    ///requests the submitListener to be the active submitListener
    List<Function(String)> input =
        [submitListener] + (changeListener != null ? [changeListener] : []);
    _subscribersMap[id] = input;
    _subscriberIds.insert(0, id);
    // _suscribers.insert(0, input);
    return () {
      // release(submitListener, changeListener: changeListener);
      releaseSubscriberWithId(id!);
    };
  }

  releaseActive() {
    ///releases the active submitListener
    if (_subscriberIds.isNotEmpty) {
      // _suscribers.removeAt(0);
      String id = _subscriberIds[0];
      _subscriberIds.removeAt(0);
      _subscribersMap.remove(id);
    }
  }

  releaseSubscriberWithId(String id) {
    if (_subscriberIds.contains(id)) {
      _subscriberIds.remove(id);
      _subscribersMap.remove(id);
    }
  }

  listenOnSubmit(String s) {
    ///conntect this to incoming text onSubmit
    ///entry point for the input
    if (_topSubmitListener != null) {
      if (_topSubmitListener!(s)) {
        ///if the top submitListener returns true, then the input is consumed
        return;
      }
    }
    if (_subscriberIds.isNotEmpty) {
      _subscribersMap[_subscriberIds[0]]![0](s);

      /// ^ if there is no subscriber
    } else {
      _rootSubmitListener(s);
    }
  }

  listenOnChange(String s) {
    ///optional: connect this to incoming text onChange
    if (_topChangeListener != null) {
      if (_topChangeListener!(s)) {
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

  bool isActive(Function(String) submitListener) {
    ///checks if the submitListener is the active submitListener
    if (_subscriberIds.isNotEmpty) {
      return _subscribersMap[_subscriberIds[0]]![0] == submitListener;
    }
    return false;
  }
}
