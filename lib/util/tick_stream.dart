
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class TickStream{
  final int start;
  final BehaviorSubject<int> _duration = BehaviorSubject<int>.seeded(0);
  late final Timer timer;
  TickStream(this.start){
    ///TickStream uses Microseconds/ SinceEpoch
    timer = Timer.periodic(Duration(microseconds: 100), (timer) {
      _duration.add(DateTime.now().millisecondsSinceEpoch - start);
    });
  }
  Stream<int> get stream => _duration.stream;
  //end stream(end int
  void end(int end){
    timer.cancel();
    _duration.add(end-start);
  }
}