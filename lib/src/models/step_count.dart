part of '../../dangple_mobile_tracker.dart';

class DangpleStepCount {
  late DateTime timeStamp;
  late int steps;

  DangpleStepCount({
    required this.steps,
    required this.timeStamp,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['steps'] = steps;
    data['time_stamp'] = timeStamp;

    return data;
  }

  @override
  String toString() => 'Steps taken: $steps at ${timeStamp.toIso8601String()}';
}
