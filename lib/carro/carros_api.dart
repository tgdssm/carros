import 'dart:convert';
import 'package:cars/carro/carro.dart';
import 'package:http/http.dart' as http;


class CarrosApi {
  static Future<List<Carro>> getCarros() async{
    await Future.delayed(Duration(seconds: 3));
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';
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