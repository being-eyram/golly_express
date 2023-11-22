/// The [Endpoints] class provides a centralized management of API endpoints for the app.
class Endpoints {
  Endpoints._();

  static const _baseUrl = 'gollyexpress.com';
  static final login = Uri.https(_baseUrl, '/login');
  static final signup = Uri.https(_baseUrl, '/signup');
  static final packageCategories = Uri.https(_baseUrl, '/estimate/categories');
  // static final forgotPassword = Uri.https(_baseUrl, '/forgot-password');
  static final verifyOtp = Uri.https(_baseUrl, '/forgot-password/verify');
  static final resetPassword = Uri.https(_baseUrl, '/forgot-password/reset');
  static final address = Uri.https(_baseUrl, '/address');
  static final user = Uri.https(_baseUrl, '/user');
  static final categories = Uri.https(_baseUrl, '/estimate/categories');

  static Uri forgotPassword({Map<String, dynamic>? queryParam}) {
    return Uri.https(_baseUrl, '/forgot-password', queryParam);
  }
}
