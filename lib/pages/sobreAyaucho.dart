import 'package:flutter/material.dart';

List<String> iniAyacucho = [
  "https://www.iperu.org/wp-content/uploads/2016/01/ubicacion-de-ayacucho.jpg",//Ayacucho mapa
  "https://denomades.s3.us-west-2.amazonaws.com/blog/wp-content/uploads/2020/09/13172228/arco-ayacucho.jpg",     //Ayacucho Plaza
  "https://www.iperu.org/wp-content/uploads/2016/01/flora-y-fauna-del-peru.jpg",   //Flora y fauna
  "https://www.iperu.org/wp-content/uploads/2016/01/que-comprar-en-ayacucho.jpg",    //Artesania
  "https://www.iperu.org/wp-content/uploads/2016/01/carnaval-ayacuchano.jpg",    //Carnaval Ayacucho
];

class SobreAyacucho extends StatelessWidget {
  const SobreAyacucho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ayacucho')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 70.0,
                  width: 250.0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(iniAyacucho[index],fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ),
            textSection,
        ],
    )
    );
  }
}

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.'
    'Paraffo 02 lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    ,
    softWrap: true,
  ),
);
