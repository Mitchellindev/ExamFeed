import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  void clearAll() {
    _sharedPrefs.clear();
  }

  bool get firstTime => _sharedPrefs.getBool('firstTime') ?? true;

  set firstTime(bool value) {
    _sharedPrefs.setBool('firstTime', value);
  }

  String? get accessToken => _sharedPrefs.getString('accessToken');

  set accessToken(String? value) {
    _sharedPrefs.setString('accessToken', value ?? '');
  }

  String? get refreshToken => _sharedPrefs.getString('refreshToken');

  set refreshToken(String? value) {
    _sharedPrefs.setString('refreshToken', value ?? '');
  }

  String? get email => _sharedPrefs.getString('email');

  set email(String? value) {
    _sharedPrefs.setString('email', value ?? '');
  }
}
