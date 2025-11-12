import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/accountmodel.dart';
import 'package:flutter_application_6/services/accountservices.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel? acc;
  Future<void> login({required String email, required String password}) async {
    acc = await AuthService.login(email, password);
    notifyListeners();
  }

  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    acc = await AuthService.signup(name, email, phone, password);
  }
      notifyListeners();

}
