import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cms/model/User.dart';
import 'package:flutter_app_cms/services/ServicesApi.dart';

class SetupProfile extends StatefulWidget {
  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _idController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _numController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = ServicesAPI.userModel.name;
    _idController.text = ServicesAPI.userModel.tk;
    _passController.text = ServicesAPI.userModel.mk;
    _numController.text = ServicesAPI.userModel.numberphone;
    _emailController.text = ServicesAPI.userModel.email;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Image.asset(
                'assets/logo/brave-browser.png',
                height: 200.0,
                width: 200.0,
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Input Name User please',
                        labelText: 'User',
                      ),
                    ),
                    TextField(
                      controller: _idController,
                      decoration: InputDecoration(
                        hintText: 'Input  ID please',
                        labelText: 'ID',
                      ),
                    ),
                    TextField(
                      controller: _passController,
                      decoration: InputDecoration(
                        hintText: 'Input  Password please',
                        labelText: 'Password',
                      ),
                    ),
                    TextField(
                      controller: _numController,
                      decoration: InputDecoration(
                        hintText: 'Input  NumberPhone please',
                        labelText: 'NumberPhone',
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Input  Email please',
                        labelText: 'Email',
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                onPressed: () {
                  UserModel _user = new UserModel(
                      email: _emailController.text.trim(),
                      mk: _passController.text.trim(),
                      tk: _idController.text.trim(),
                      numberphone: _numController.text.trim(),
                      name: _nameController.text.trim());
                  var i = 0;
                  for (var item in ServicesAPI.lstUser) {
                    if (item == ServicesAPI.userModel) {
                      setState(() {
                        ServicesAPI.lstUser[i] = _user;
                        ServicesAPI.userModel = _user;
                      });
                    }
                    setState(() {
                      i++;
                    });
                  }
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text("Thông báo "),
                        content: new Text("Bạn Đã Cập Nhật thành công"),
                      ));
                },
                color: Colors.orange,
              ),
              RaisedButton(
                child: Text(
                  'Back Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                color: Colors.grey[200],
              )
            ],
          ),
        ),
      ),
    );
  }
}
