import 'package:flutter/material.dart';
import 'explorePage.dart';
import 'detalle_lugar.dart';

class detalleCategoria{
  int? id;
  int? item;
  String? titu;
  String? desc;
  String? foto;

  detalleCategoria(this.id,this.item,this.titu,this.desc,this.foto);

  detalleCategoria.map(dynamic o){
    this.id = o["id"];
    this.item = o["item"];
    this.titu = o["titu"];
    this.desc = o["desc"];
    this.foto = o["foto"];
  }

  int get _id => id!;
  int get _item => _item;
  String get _titu => titu!;
  String get _desc => desc!;
  String get _foto => foto!;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['item'] = item;
    map['titu'] = titu;
    map['desc'] = desc;
    map['foto'] = foto;
    return map;
  }

}

final detalle =[
  new detalleCategoria(1, 1, "Pampa de la quinua 00", "Lugar para disfrutar en familia", "assets/familia.png"),
  new detalleCategoria(1, 2, "Pampa de la quinua 01", "Lugar para disfrutar en familia", "assets/familia.png"),
  new detalleCategoria(1, 2, "Pampa de la quinua 02", "Lugar para disfrutar en familia", "assets/familia.png"),
  new detalleCategoria(1, 4, "Pampa de la quinua 03", "Lugar para disfrutar en familia", "assets/familia.png"),
  //(1,"Familiar","Disfruta en familia","assets/familia.png"),
  //(2,"Romántico","","assets/romantico.png"),
  //(3,"Aventura","","assets/aventura.png"),
  //(4,"Cultura","Aprende sobre cultura","assets/cultura.png"),
];

class DetalleCategoria extends StatelessWidget {
  //const DetalleCategoria({Key? key}) : super(key: key);

  final Datosdetalle data;
  const DetalleCategoria({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(data.nomb),
        ),
        body: new ListView.builder (
            itemCount: detalle.length,
            itemBuilder: (BuildContext context,int index) => SizedBox(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),
              elevation: 5,
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                    title: Text(detalle[index].titu!),
                    subtitle: Text(detalle[index].desc!),
                    leading:  Image.asset(detalle[index].foto!,fit:BoxFit.cover,height: 70.0, width: 80.0,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetalleLugar()),
                        )
                      }, child: Text('+')),
                    ],
                  )
                ],
              ),
            )
          )
          //children: detalle.map(detalleCard).toList(),

        )
    );
  }
}


Card detalleCard(detalleCategoria deta) {

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 5,
    // Usamos columna para ordenar un ListTile y una fila con botones
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(deta.titu!),
          subtitle: Text(deta.desc!),
          leading:  Image.asset(deta.foto!,fit:BoxFit.cover,height: 70.0, width: 80.0,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () => {

            }, child: Text('+')),
          ],
        )
      ],
    ),
  );
}

