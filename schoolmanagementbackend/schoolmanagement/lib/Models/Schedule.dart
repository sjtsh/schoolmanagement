class Routine {
  final String moduleName;
  final int day;
  final DateTime startTime;
  final DateTime endTime;
  final String? remarks;
  final String? meetLink;

  Routine(this.moduleName, this.day, this.startTime, this.endTime,
      {this.remarks, this.meetLink});
}
