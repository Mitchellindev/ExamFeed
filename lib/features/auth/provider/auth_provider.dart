

import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  static AuthenticationProvider? _instance;
  // static late ApiService apiService;
  // static late AuthService service;

  AuthenticationProvider() {
    // service = AuthHttpService();
    // apiService = ApiServiceImpl();
  }

  static AuthenticationProvider get instance {
    _instance ??= AuthenticationProvider();
    return _instance!;
  }

 
}
