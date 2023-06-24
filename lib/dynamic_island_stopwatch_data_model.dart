class DynamicIslandStopwatchDataModel {
  final int elapsedSeconds;

  DynamicIslandStopwatchDataModel({
    required this.elapsedSeconds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'elapsedSeconds': elapsedSeconds,
    };
  }
}
