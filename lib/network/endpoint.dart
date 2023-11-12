/// The [Endpoint] class provides a centralized management of API endpoints for the app.
class Endpoint {
  Endpoint._();

  static const _baseUrl = 'gollyexpress.com';
  static final login = Uri.https(_baseUrl, '/login');
}
