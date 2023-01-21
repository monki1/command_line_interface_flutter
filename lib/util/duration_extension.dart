extension DurationExtension on Duration{
  //fromMSE
  // @override
  String toDurationString() {
    int days = inDays;
    int hours = inHours - days * 24;
    int minutes = inMinutes - days * 24 * 60 - hours * 60;
    int seconds = inSeconds - days * 24 * 60 * 60 - hours * 60 * 60 - minutes * 60;
    int milliseconds = inMilliseconds - days * 24 * 60 * 60 * 1000 - hours * 60 * 60 * 1000 - minutes * 60 * 1000 - seconds * 1000;
    String dayString = days == 0 ? "" : days.toString() + "d ";
    String hoursString = hours == 0 ? "" : hours.toString() + "h ";
    String minutesString = minutes == 0 ? "" : minutes.toString() + "m ";
    String secondsString = seconds < 10 ? "0$seconds" : "$seconds";
    String millisecondsString = milliseconds.toString();
    millisecondsString = millisecondsString.length == 1 ?
      "00$millisecondsString" : millisecondsString.length == 2 ?
          "0$millisecondsString" : millisecondsString;
    return "${dayString}${hoursString}${minutesString}${secondsString}s ${millisecondsString}ms";
  }
}

