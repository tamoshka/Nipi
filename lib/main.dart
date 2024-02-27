import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'PolygonMap.dart';
import 'PolylineMap.dart';
import 'CircleMap.dart';
import 'MapDataBasePage.dart';
import 'package:geodesy/geodesy.dart';

void main() {
  runApp(const MaterialApp(home:MyApp()),);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({super.key,});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double e = Random().nextInt(10)/20;
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    if (index==1)
    {
      setState(() {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
          return MapDB();
        },
        ),
        );
      });
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('НипиКарта'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(56.285, 84.42),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
          CircleMap(),
          PolygonMap(),
          PolylineMap()
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          setState(() {
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'БД',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


