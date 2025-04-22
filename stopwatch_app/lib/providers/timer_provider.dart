import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  Duration _duration = Duration.zero;
  bool _isRunning = false;
  Timer? _timer;

  Duration get duration => _duration;
  bool get isRunning => _isRunning;

  void start() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      _duration += const Duration(milliseconds: 10);
      notifyListeners();
    });
  }

  void stop() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    _isRunning = false;
    _timer?.cancel();
    _duration = Duration.zero;
    notifyListeners();
  }

  String get formattedTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(_duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(_duration.inSeconds.remainder(60));
    String twoDigitMilliseconds = twoDigits(_duration.inMilliseconds.remainder(1000) ~/ 10);
    return "$twoDigitMinutes:$twoDigitSeconds.$twoDigitMilliseconds";
  }
} 