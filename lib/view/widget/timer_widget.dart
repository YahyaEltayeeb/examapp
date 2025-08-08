import 'package:examapp/core/calc/calc_timer.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/assets_constant.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final int examtTime;

  final void Function()? onTap;

  const TimerWidget({super.key, required this.examtTime, required this.onTap});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

late ExamTimer examTimer;
int remindTime = 0;

class _TimerWidgetState extends State<TimerWidget> {
  @override
  void initState() {
    examTimer = ExamTimer(examTime: widget.examtTime);
    examTimer.start(
      onTick: (miniuts) {
        setState(() {
          remindTime = miniuts;
        });
      },
      onFinish: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.timeEnd,
              style: TextStyle(color: AppColors.red),
            ),

            content: FilledButton(
              onPressed: widget.onTap,
              child: Text(
                AppLocalizations.of(context)!.viewScore,
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (remindTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (remindTime % 60).toString().padLeft(2, '0');

    int minutsParse = int.parse(minutes);
    final halfTime = minutsParse / 2;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(AssetsConstant.alertPhoto),
          Text(
            '$minutes:$seconds',
            style: minutes == halfTime.toString()
                ? Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppColors.red)
                : Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: AppColors.green),
          ),
        ],
      ),
    );
  }
}
