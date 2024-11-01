class ApiConstants {
  static const String baseUrl = 'https://opposite-striped-makemake.glitch.me';
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String products = '/product';
  static const String transactions = '/transaction';
  
  // Headers
  static Map<String, String> getHeaders({String? token}) => {
    'Content-Type': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };
}