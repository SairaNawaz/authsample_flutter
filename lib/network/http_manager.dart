import 'dart:convert';

import 'package:flutter_uniutamademo/ui/constants.dart';
import 'package:http/http.dart' as http;

import 'models/login_model.dart';

Future<LoginModel> getLoginData(context, String email, String password) async {
  LoginModel result = LoginModel();
  try {
    var head = Map<String, String>();
    //head['content-type'] = 'application/x-www-form-urlencoded';

    var authParams = Map<String, String>();
    authParams['email'] = email;
    authParams['password'] = password;

    const String apiEndpoint = BASE_URL;
    final Uri url = Uri.parse(apiEndpoint);
    final response = await http.post(
      url,
      body: authParams,
      headers: head,
    );
    print(response);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = LoginModel.fromJson(item);
    } else {
      print(response);
    }
  } catch (e) {
    print(e);
  }
  return result;
}
