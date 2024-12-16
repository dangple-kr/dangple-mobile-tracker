part of '../../dangple_mobile_tracker.dart';

class DangpleStepCount {
  late DateTime timeStamp;
  late int steps;

  DangpleStepCount({
    required this.steps,
    required this.timeStamp,
  });

  factory DangpleStepCount.fromJson(Map<String, dynamic> json) {
    return DangpleStepCount(
      steps: json['steps'],
      timeStamp: DateTime.tryParse(json['time_stamp']) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['steps'] = steps;
    data['time_stamp'] = timeStamp.toIso8601String();

    return data;
  }

  @override
  String toString() => 'Steps taken: $steps at ${timeStamp.toIso8601String()}';
}
