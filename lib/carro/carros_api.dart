import 'dart:convert';
import 'package:cars/carro/carro.dart';
import 'package:http/http.dart' as http;

class Tipos{
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";

}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async{
    await Future.delayed(Duration(seconds: 3));
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';
    var response = await http.get(url);
    List res = json.decode(response.body);
    var carros = List<Carro>();

    for(Map map in res){
      Carro c = Carro.fromJson(map);
      carros.add(c);
    }
    return carros;
  }

}