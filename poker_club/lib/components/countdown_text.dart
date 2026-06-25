import 'package:flutter/widgets.dart';

class CountdownText extends StatefulWidget {
  final DateTime dateTime;
  final TextStyle? textStyle;
  final String Function(String countdown)? onFormatText;
  const CountdownText({
    super.key,
    required this.dateTime,
    this.textStyle,
    this.onFormatText,
  });

  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  final timer = Stopwatch();
  var countdown = '';

  @override
  initState() {
    super.initState();
    countdown = _formatDuration(widget.dateTime.difference(DateTime.now()));
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.onFormatText?.call(countdown) ?? countdown,
      style: widget.textStyle,
    );
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          countdown = _formatDuration(
            widget.dateTime.difference(DateTime.now()),
          );
        });
        _startCountdown();
      }
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    // if in days show #d if in hrs show #h if in mins show #m if in sec show #s
    if (duration.inDays > 0) {
      return '${duration.inDays}D';
    } else if (hours > 0) {
      return '${hours}H';
    } else if (minutes > 0) {
      return '${minutes}M';
    } else if (seconds > 0) {
      return '${seconds}S';
    } else {
      return '0';
    }
  }
}
