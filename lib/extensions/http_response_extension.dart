import 'package:http/http.dart' as http;

extension HttpResponseExtension on http.Response {
  bool get didSucceed => statusCode >= 200 && statusCode < 300;
}
