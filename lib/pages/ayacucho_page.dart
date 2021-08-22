import 'package:flutter/material.dart';
import 'package:tinder_ayacucho/controllers/login_controller.dart';

import 'explorePage.dart';
import 'savedPage.dart';
import 'createtrip.dart';
import 'profilePage.dart';

class AyacuchoPage extends StatefulWidget{
  final DatosLogin data;
  const AyacuchoPage({required this.data});

  @override
  _AyacuchoPageState createState() => _AyacuchoPageState();
}

class _AyacuchoPageState extends State<AyacuchoPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    SavedTripPage(),
    CreateTrip(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bienvenido:"+widget.data.nomb,
          style: TextStyle(fontSize: 12),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size:35),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border,size:35),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,size:35),
            label: 'Trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size:35),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xfff05042),
        onTap: _onItemTapped,
        unselectedItemColor: Color(0xff3a3a3a),
        showUnselectedLabels: true,
      ),
    );
  }
}