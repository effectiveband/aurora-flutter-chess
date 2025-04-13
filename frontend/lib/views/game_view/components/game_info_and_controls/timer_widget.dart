import "package:flutter/material.dart";
import "../../../../exports.dart";

class TimerWidget extends StatelessWidget {
  final Duration timeLeft;
  final bool isFilled;

  const TimerWidget(
      {super.key, required this.timeLeft, required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isFilled
            ? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
              vertical: MediaQuery.sizeOf(context).width * 0.01),
          child: Text(_durationToString(timeLeft),
              style: const TextStyles()
                  .header1
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
      ),
    );
  }

  String _durationToString(Duration duration) {
    if (duration.inHours > 0) {
      String hours = duration.inHours.toString();
      String minutes =
          duration.inMinutes.remainder(60).toString().padLeft(2, "0");
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, "0");
      return "$hours:$minutes:$seconds";
    } else if (duration.inMinutes > 0) {
      String minutes = duration.inMinutes.toString();
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, "0");
      return "$minutes:$seconds";
    } else {
      String seconds = duration.inSeconds.toString();
      return seconds;
    }
  }
}
