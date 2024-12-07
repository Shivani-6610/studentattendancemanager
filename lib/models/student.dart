class Student {
  String id;
  String name;
  String rollNo;
  String sec;
  Map<DateTime, bool> attendance; // Attendance for each date

  Student({
    required this.id,
    required this.name,
    required this.rollNo,
    required this.sec,
    required this.attendance,
  });

  // Calculate attendance percentage for a specific month (based on the present days of the month)
  double getAttendancePercentageForMonth(DateTime month) {
    int presentCount = 0;
    int totalDaysInMonth = 0;

    // Loop through the attendance map and check for the specified month
    attendance.forEach((date, isPresent) {
      if (date.year == month.year && date.month == month.month) {
        totalDaysInMonth++;
        if (isPresent) presentCount++;
      }
    });

    // Return percentage based on present days in that month
    return totalDaysInMonth > 0 ? (presentCount / totalDaysInMonth) * 100 : 0.0;
  }
}
