import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cms/services/ServicesApi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = true;
  TextEditingController _idController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  void onToggleee() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onTapNavigateForgot() {}
  void onTapNavigateRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('LOGIN',style: TextStyle(
      //   color: Colors.cyan,
      //   fontSize: 18.0,
      //   letterSpacing: 1.0
      // )),
      // backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              'assets/logo/brave-browser.png',
              height: 300.0,
              width: 300.0,
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      hintText: 'Input  ID please',
                      labelText: 'User',
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        //decode password
                        controller: _passController,
                        obscureText: _showPass,
                        decoration: InputDecoration(
                          hintText: 'Input  Passworld please',
                          labelText: 'Passworld',
                        ),
                      ),
                      GestureDetector(
                        onTap: onToggleee,
                        child: Text(
                          _showPass ? 'SHOW' : 'HIDE',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: onTapNavigateForgot,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: onTapNavigateRegister,
                  child: Text('Register Password',
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
              child: Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
              onPressed: () {
                for (var item in ServicesAPI.lstUser) {
                  if (_idController.text.trim() == item.tk &&
                      _passController.text.trim() == item.mk) {
                    setState(() {
                      print('vao login');
                      ServicesAPI.userModel = item;
                      Navigator.pushNamed(context, '/home');
                    });
                  }
                  print('khong có');
                }
                // if (_idController.text.trim() == 'bao' &&
                //     _passController.text.trim() == '123456') {}
              },
              color: Colors.orange,
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
              child: Text(
                'Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              color: Colors.blueGrey[200],
            )
          ],
        ),
      ),
    );
  }
}
