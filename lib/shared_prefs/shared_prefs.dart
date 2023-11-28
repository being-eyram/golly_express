import 'package:shared_preferences/shared_preferences.dart';

setUserOnboardStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('is_onboarded', value);
}

Future<bool?> getUserOnboardStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('is_onboarded');
}

setUserBearerToken(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('bearer_token', value);
}

Future<String?> getUserBearerToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('bearer_token');
}

removeUserBearerToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove('bearer_token');
}
