import 'package:carros/src/models/carro.dart';
import 'package:flutter/material.dart';

import 'carros_api.dart';

class CarrosList extends StatefulWidget {

  String tipo;

  CarrosList(this.tipo);

  @override
  _CarrosListState createState() => _CarrosListState();
}

class _CarrosListState extends State<CarrosList> with AutomaticKeepAliveClientMixin<CarrosList> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    Future<List<Carro>> carros = CarrosApi.getCarros(widget.tipo);

    return FutureBuilder(
      future: carros,
      builder: (context, snapshot) {

        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Carro> carros = snapshot.data;
        return _listView(carros);
      },
    );
  }

  ListView _listView(List<Carro> carros) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: carros != null ? carros.length : 0,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Image.network(carros[index].urlFoto, width: 150.0,)),
                Text(carros[index].nome ?? "Teste", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.0),),
                Text("descrição..."),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(onPressed: () {}, child: Text("DETALHES")),
                      FlatButton(onPressed: () {}, child: Text("SHARE")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
