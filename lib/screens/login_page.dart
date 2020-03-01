import 'package:cars/widgets/button.dart';
import 'package:cars/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _login = TextEditingController();

  final _senha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 150),
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppTextFormField("Login", "Digite o e-mail", controller: _login, validator: (String texto){
                if(texto.isEmpty){
                  return "Digite o login";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              proxFocus: _focusNode,
            ),
            SizedBox(height: 10,),
            AppTextFormField("Senha", "Digite a senha", senha: true, controller: _senha, validator: (String texto){
                if(texto.isEmpty){
                  return "Digite a senha";
                }
                if(texto.length < 8){
                  return "A senha precisa ter pelo menos 8 digitos";
                }
                return null;
              },
              keyboardType: TextInputType.text,
              focusNode: _focusNode
            ),
            SizedBox(height: 20,),
            AppButton("Login", onPressed: _onClickLogin,)
          ],
        ),
      ),
    );
  }

  void _onClickLogin() {
    if(!_formKey.currentState.validate()){
      return;
    }
    String login = _login.text;
    String senha = _senha.text;
  }
}
