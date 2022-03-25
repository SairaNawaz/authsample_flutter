import 'package:flutter/material.dart';
import 'package:flutter_uniutamademo/network/login_provider.dart';
import 'package:flutter_uniutamademo/ui/widgets/custom_button.dart';
import 'package:flutter_uniutamademo/ui/widgets/input_text_field.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  var txtUserNameController = TextEditingController();
  var txtUserPwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final lgnMdl = Provider.of<LoginProvider>(context, listen: false);
    lgnMdl.loadLogin();
  }

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlutterLogo(
            textColor: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Welcome to Uniutama",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          ),
        ],
      );

  loginBody(isloading) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            loginHeader(),
            isloading ? CircularProgressIndicator() : loginFields()
          ],
        ),
      );

  loginFields() => Container(
        child: Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                InputTextField(
                    controller: txtUserNameController,
                    hint: "Enter Email",
                    iconData: Icons.mail_outline,
                    isEmail: true),
                InputTextField(
                  controller: txtUserPwdController,
                  hint: "Enter Password",
                  iconData: Icons.lock_outlined,
                  isPassword: true,
                ),
                CustomButton(
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      Provider.of<LoginProvider>(context, listen: false).signIn(
                          context,
                          txtUserNameController.text.toString(),
                          txtUserPwdController.text.toString());
                      Get.to(() => Dashboard());
                    }
                  },
                  title: 'Login',
                ),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    final loginMdl = Provider.of<LoginProvider>(context);
    return GetMaterialApp(
        home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: loginBody(loginMdl.loading)),
      ),
    ));
  }
}
