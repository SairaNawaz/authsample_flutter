import 'package:flutter/material.dart';
import 'package:flutter_uniutamademo/ui/constants.dart';

import 'http_manager.dart';
import 'models/login_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  bool loading = true;

  loadLogin() {
    Future.delayed(Duration(milliseconds: 3000), () {
      // Do something
      loading = false;
      notifyListeners();
    });
  }

  signIn(context, String emailTxt, String pwdTxt) async {
    loading = true;
    if (BASE_URL.contains("localhost")) {
      await Future.delayed(Duration(milliseconds: 500));
      loginModel = LoginModel.mock();
    } else {
      loginModel = await getLoginData(context, emailTxt, pwdTxt);
    }
    loading = false;
    notifyListeners();
  }
}
