import 'dart:async';
import 'dart:ui';

class ExamTimer {
  Timer? timer;
   int examTime;
  ExamTimer({required this.examTime});

  void start({ required void Function(int minites) onTick,
    required VoidCallback onFinish,}) {
    timer = Timer.periodic(Duration(seconds: 1), (ttimer) {
      if (examTime > 0) {
        examTime -= const Duration(seconds: 1).inSeconds;
        onTick(examTime);
      }
      else{
        timer?.cancel();
        onFinish();

      }
    });
  }
}
