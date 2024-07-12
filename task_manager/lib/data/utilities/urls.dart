class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createTask = '$_baseUrl/createTask';
  static const String newTasks = '$_baseUrl/listTaskByStatus/New';
  static const String progressTasks = '$_baseUrl/listTaskByStatus/Progress';
  static const String completedTasks = '$_baseUrl/listTaskByStatus/Completed';
  static const String cancelledTasks = '$_baseUrl/listTaskByStatus/Cancelled';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';
  static const String resetPassword = '$_baseUrl/RecoverResetPass';

  static String verifyEmail(String email) =>
      '$_baseUrl/RecoverVerifyEmail/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/RecoverVerifyOTP/$email/$otp';

  static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';

  static String updateTaskStatus(String id, String status) =>
      '$_baseUrl/updateTaskStatus/$id/$status';
  static String updateProfile = '$_baseUrl/profileUpdate';
}
