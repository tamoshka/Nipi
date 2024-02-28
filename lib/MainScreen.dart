import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'PolygonMap.dart';
import 'PolylineMap.dart';
import 'CircleMap.dart';
import 'MapDataBasePage.dart';
import 'package:geodesy/geodesy.dart';

class MainScreen extends StatefulWidget {
  // This widget is the root of your application.
  const MainScreen({super.key,});
  @override
  State<MainScreen> createState()=>MainScreenState();
}


class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var mypolygones = <Polygon>[
    Polygon(points:[LatLng(56.28, 84.41), LatLng(56.27, 84.419), LatLng(56.289, 84.42)], color: Colors.red, isFilled: true)
  ];
  var mypolylines = <Polyline>[
    Polyline(points:[LatLng(56.291, 84.43), LatLng(56.3, 84.44), LatLng(56.295, 84.45)], color: Colors.red)
  ];
  var mycircle = <CircleMarker>[
    CircleMarker(point:LatLng(56.3, 84.4), radius:1000, useRadiusInMeter: true,)
  ];

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
    double e = Random().nextInt(10)/20;
    String cordPoly=(56.28+e).toString()+','+(84.41+e).toString()+'; '+(56.27+e).toString()+','+(84.419+e).toString()+'; '+(56.289+e).toString()+','+(84.42+e).toString();
    mypolygones.add(Polygon(label:'Полигон\n+$cordPoly', labelPlacement: PolygonLabelPlacement.polylabel, labelStyle: TextStyle(fontWeight: FontWeight.bold),
    points: [LatLng(56.28+e, 84.41+e), LatLng(56.27+e, 84.419+e), LatLng(56.289+e, 84.42+e)], color: e<0.25? Colors.red:Colors.blue, isFilled: true)
    );

    mypolylines.add(Polyline(points: [LatLng(56.291+e, 84.43+e), LatLng(56.3+e, 84.44+e), LatLng(56.295+e, 84.45+e)], color: e<0.25? Colors.red:Colors.blue));
    mycircle.add(CircleMarker(point:LatLng(56.3+e, 84.4+e), radius:1000, useRadiusInMeter: true,));
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
          ///onTap: onPolygon
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
          CircleMap(mycircle, e),
          PolygonMap(mypolygones, e),
          PolylineMap(mypolylines, e)
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