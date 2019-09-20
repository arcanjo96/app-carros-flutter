import 'package:carros/src/utils/alert_dialog.dart';
import 'package:carros/src/utils/login_api.dart';
import 'package:carros/src/widgets/button.dart';
import 'package:carros/src/widgets/textFormField.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _showProgress = false;

  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextFormWidget("Login", "example@...", false, _loginController, validator: _validateLogin, keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10.0,),
            TextFormWidget("Senha", "123...", true, _passwordController, validator: _validateSenha, keyboardType: TextInputType.text),
            SizedBox(height: 10.0,),
            Button("Entrar", () => _login(_loginController.text, _passwordController.text), showProgress: _showProgress,),
          ],
        ),
      ),
    );
  }

  _login(login, password) async {

    if(!_formKey.currentState.validate()) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    final response = await LoginApi.login(login, password);

    if(response.ok) {
      final user = response.result;
      print(user);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      setState(() {
        _showProgress = false;
      });
    } else {
      setState(() {
        _showProgress = false;
      });
      alert(context, response.msg);
    }

  }

  String _validateSenha(String text) {
    if(text.isEmpty) {
      return "Digite a senha";
    }
    if(text.length < 3) {
      return "A senha deve conter pelo menos 3 caracteres.";
    }
    return null;
  }

  String _validateLogin(String text) {
    if(text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }


}
