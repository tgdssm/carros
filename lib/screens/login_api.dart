import 'dart:convert';
import 'package:cars/screens/api_response.dart';
import 'package:cars/screens/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async{

    try{
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Context-Type": "application/json"};
      Map parametros = {'username': login, 'password': senha};

      String body = json.encode(parametros);

      var response = await http.post(url, body: body, headers: headers);

      Map res = json.decode(response.body);
      if(response.statusCode == 200){
        final user = Usuario(res);
        return ApiResponse.ok(user);
      }
      return ApiResponse.erro(res['error']);
    }catch(erro){
      return ApiResponse.erro("Não foi possivel fazer o login, verifique sua conexão");
    }
  }
}