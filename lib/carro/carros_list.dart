import 'package:cars/carro/carro.dart';
import 'package:cars/carro/carros_api.dart';
import 'package:flutter/material.dart';

class CarrosList extends StatelessWidget {

  String tipo;
  CarrosList(this.tipo);

  @override
  Widget build(BuildContext context) {
    return _body();
  }
  _body() {

    Future<List<Carro>> chamadaCarros = CarrosApi.getCarros(tipo);
    return FutureBuilder(
        future: chamadaCarros,
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
            case ConnectionState.done:
          }
          List<Carro> carros = snapshot.data;
          return _listView(carros);
        }
    );

  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (context, index){
            Carro c = carros[index];
            /*return Row(
            children: <Widget>[
              Image.network(c.urlFoto, width: 150,),
              Flexible(child: Text(c.nome)),
            ],
          );*/
            return Card(
              color: Colors.grey[100],
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(c.urlFoto ?? "https://cdn.pixabay.com/photo/2017/08/29/09/38/car-2692593_960_720.png"),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(c.nome, style: TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Detalhes'),
                        onPressed: () { /* ... */ },
                      ),
                      FlatButton(
                        child: const Text('Share'),
                        onPressed: () { /* ... */ },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}

