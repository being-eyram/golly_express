import 'package:shared_preferences/shared_preferences.dart';

setUserOnboardStatus(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('is_onboarded', value);
}

Future<bool?> getUserOnboardStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('is_onboarded');
}
