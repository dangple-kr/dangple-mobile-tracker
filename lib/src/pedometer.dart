part of '../dangple_mobile_tracker.dart';

class DangplePedometer {
  static Stream<DangpleStepCount> get stepCountStream =>
      Pedometer.stepCountStream
          .transform(StreamTransformer.fromHandlers(handleData: (e, sink) {
        final previousSteps = _previousSteps ??= e.steps;

        sink.add(DangpleStepCount(
          timeStamp: e.timeStamp,
          steps: e.steps - previousSteps - _cumulativeSteps,
        ));

        final previousDate = DateTime(
          _detectDateChange.year,
          _detectDateChange.month,
          _detectDateChange.day,
        );
        final date =
            DateTime(e.timeStamp.year, e.timeStamp.month, e.timeStamp.day);

        if (previousDate != date) {
          _cumulativeSteps = e.steps - previousSteps;
        }
        _detectDateChange = e.timeStamp;
      }));

  static int? _previousSteps;

  static int _cumulativeSteps = 0;

  static DateTime _detectDateChange = DateTime.now();
}
