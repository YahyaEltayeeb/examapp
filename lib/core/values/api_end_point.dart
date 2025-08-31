abstract class ApiEndPoint {
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1/';
  static const String signUpEndPoint = 'auth/signup';
  static const String signInEndPoint = 'auth/signin';
  static const String forgetPAsswordEndPoint = 'auth/forgotPassword';
  static const String verifyCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';
  static const String getAllExams = 'exams';
  static const String getExamsById = 'exams';
  static const String getSubject = 'subjects';
  static const String getQuetionsByExamId = 'questions';
  static const String getExamBySub = 'exams';
  static const String editProfile = 'auth/editProfile';
  static const String getUserData = 'auth/profileData';
  static const String changePassword='auth/changePassword';


}
