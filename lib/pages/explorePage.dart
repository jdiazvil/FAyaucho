import 'package:flutter/material.dart';
import 'package:tinder_ayacucho/pages/detalle_categoria.dart';
import 'sobreAyaucho.dart';
import 'detalle_categoria.dart';

class Categoria{
  int? id;
  String? titu;
  String? subt;
  String? foto;

  Categoria(this.id,this.titu,this.subt,this.foto);

  Categoria.map(dynamic o){
    this.id = o["id"];
    this.titu = o["titu"];
    this.subt = o["subt"];
    this.foto = o["foto"];
  }

  int get _id => id!;
  String get _titu => titu!;
  String get _subt => subt!;
  String get _foto => foto!;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['titu'] = titu;
    map['subt'] = subt;
    map['foto'] = foto;
    return map;
  }

}

final menu =[
  new Categoria(1,"Familiar","Disfruta en familia","assets/familia.png"),
  new Categoria(2,"Romántico","","assets/romantico.png"),
  new Categoria(3,"Aventura","","assets/aventura.png"),
  new Categoria(4,"Cultura","Aprende sobre cultura","assets/cultura.png"),
];

List<String> popularSpots = [
  "https://www.iperu.org/wp-content/uploads/2016/01/ubicacion-de-ayacucho.jpg",//Ayacucho mapa
  "https://denomades.s3.us-west-2.amazonaws.com/blog/wp-content/uploads/2020/09/13172228/arco-ayacucho.jpg",     //Ayacucho Plaza
  "https://www.iperu.org/wp-content/uploads/2016/01/flora-y-fauna-del-peru.jpg",   //Flora y fauna
  "https://www.iperu.org/wp-content/uploads/2016/01/que-comprar-en-ayacucho.jpg",    //Artesania
  "https://www.iperu.org/wp-content/uploads/2016/01/carnaval-ayacuchano.jpg",    //Carnaval Ayacucho
];

List<String> restaurantImgUrl = [
  "https://lastheplace.com/images/article-images/1aLatest2008Writers/august/strata-dining-and-bar-1.jpg",
  "http://www.elitetraveler.com/wp-content/uploads/2012/11/RESTAURANT-22-462x346.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-s/14/e8/1f/aa/saranda-at-7-station.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-s/0b/6c/7d/3a/restaurant.jpg",
  "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Africa/Morocco/Marrakech/marrakech-restaurants-al-fassia.jpg?imwidth=480",
];

List<String> nearMe = [
  "https://www.tourmyindia.com/blog/wp-content/uploads/2015/04/Untitled-design.png",
  "https://farm6.staticflickr.com/5125/5305133991_8cd7df1dd2_z.jpg",
  "http://www.buzzntravel.com/cache/photos/340x220_gandhinagar_40670.jpg",
  "https://blog.weekendthrill.com/wp-content/uploads/2016/05/053016_1024_15STUNNINGP12.jpg",
];

class Datosdetalle {
  final int indx;
  final String nomb;
  Datosdetalle(this.indx,this.nomb);
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: SizedBox(
                height: 60.0,
                child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                        'Ayacucho',
                        style: Theme.of(context).textTheme.headline6?.merge(
                            TextStyle(fontSize: 26.0))
                        ),
                        new IconButton(
                        onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SobreAyacucho()),
                          );
                        },
                        icon: const Icon(Icons.info_rounded),
                        color: Colors.blue,
                        tooltip: "Datos Generales",
                        iconSize: 36,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: SizedBox(
                height: 275.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: menu.length,
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 0.7
                        ),
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                final data = Datosdetalle(
                                    menu[index].id!,
                                    menu[index].titu!
                                    );
                                  //Navigator.push(context, MaterialPageRoute(builder: (_) => Detalles()));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetalleCategoria(data: data)),
                                );
                              },
                            child: Column(
                              children: [
                                  Image.asset(menu[index].foto!,fit:BoxFit.cover,height: 70.0, width: 80.0,),
                                  Text(menu[index].titu!,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                                  Text(menu[index].subt!, style: TextStyle(color: Colors.deepPurple.withOpacity(0.8),fontSize: 15.0),
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lugares recomendados',
                      style: Theme.of(context).textTheme.headline6?.merge(
                          TextStyle(fontSize: 25.0))
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          height: 80.0,
                          width: 300.0,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(popularSpots[index],fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lugares Cerca de ti',
                      style: Theme.of(context).textTheme.headline6?.merge(TextStyle(fontSize: 25.0)),                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          height: 80.0,
                          width: 300.0,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(nearMe[index],fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Restaurantes recomendados',
                      style: Theme.of(context).textTheme.headline6?.merge(TextStyle(fontSize: 25.0)),                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          height: 80.0,
                          width: 300.0,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(restaurantImgUrl[index],fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Card miCard(p_titu,pSubt,p_img) {

  return Card(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), //Esquinas circulares
    margin: EdgeInsets.all(15),
    elevation: 10, //Sombra
    child: Column(
      children: <Widget>[
        // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(p_titu),
          subtitle: Text(pSubt),
          leading: Icon(Icons.home),
        ),

        // Usamos una fila para ordenar los botones del card
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //FlatButton(onPressed: () => {}, child: Text('Aceptar')),
            //FlatButton(onPressed: () => {}, child: Text('Cancelar'))
          ],
        )
      ],
    ),
  );
}