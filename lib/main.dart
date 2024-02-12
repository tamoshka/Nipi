import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

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
  @override

  Widget build(BuildContext context) {
  double x=Random().nextInt(10)/10;
  double y=Random().nextInt(10)/10;
  double z=Random().nextInt(10)/10;
  double i=Random().nextInt(10)/10;
  double n=Random().nextInt(10)/10;
    return FlutterMap(
      options: const MapOptions(
        initialCenter:  LatLng(56.285, 84.42),
        initialZoom: 14,
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
        PolygonLayer(
          polygons: [
            Polygon (
                  points: [LatLng(56.28+x, 84.41+x), LatLng(56.27+x, 84.419+x), LatLng(56.289+x, 84.42+x)],
              color: x<0.5 ? Colors.blue : Colors.red,
              isFilled: true,
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [ LatLng(56.291+x, 84.43+x), LatLng(56.3+x, 84.44+x), LatLng(56.295+x, 84.45+x)],
              color: x<0.5 ? Colors.blue : Colors.red,
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(56.3+x, 84.4+x),
              radius: 100,
              useRadiusInMeter: true,
            ),
          ],
        ),
        PolygonLayer(
          polygons: [
            Polygon (
              points: [LatLng(56.28+y, 84.41+y), LatLng(56.27+y, 84.419+y), LatLng(56.289+y, 84.42+y)],
              color: y<0.5 ? Colors.blue : Colors.red,
              isFilled: true,
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [ LatLng(56.291+y, 84.43+y), LatLng(56.3+y, 84.44+y), LatLng(56.295+y, 84.45+y)],
              color: y<0.5 ? Colors.blue : Colors.red,
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(56.3+y, 84.4+y),
              radius: 100,
              useRadiusInMeter: true,
            ),
          ],
        ),
        PolygonLayer(
          polygons: [
            Polygon (
              points: [LatLng(56.28+z, 84.41+z), LatLng(56.27+z, 84.419+z), LatLng(56.289+z, 84.42+z)],
              color: z<0.5 ? Colors.blue : Colors.red,
              isFilled: true,
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [ LatLng(56.291+z, 84.43+z), LatLng(56.3+z, 84.44+z), LatLng(56.295+z, 84.45+z)],
              color: z<0.5 ? Colors.blue : Colors.red,
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(56.3+z, 84.4+z),
              radius: 100,
              useRadiusInMeter: true,
            ),
          ],
        ),
        PolygonLayer(
          polygons: [
            Polygon (
              points: [LatLng(56.28+i, 84.41+i), LatLng(56.27+i, 84.419+i), LatLng(56.289+i, 84.42+i)],
              color: i<0.5 ? Colors.blue : Colors.red,
              isFilled: true,
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [ LatLng(56.291+i, 84.43+i), LatLng(56.3+i, 84.44+i), LatLng(56.295+i, 84.45+i)],
              color: i<0.5 ? Colors.blue : Colors.red,
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(56.3+i, 84.4+i),
              radius: 100,
              useRadiusInMeter: true,
            ),
          ],
        ),
        PolygonLayer(
          polygons: [
            Polygon (
              points: [LatLng(56.28+n, 84.41+n), LatLng(56.27+n, 84.419+n), LatLng(56.289+n, 84.42+n)],
              color: n<0.5 ? Colors.blue : Colors.red,
              isFilled: true,
            ),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [ LatLng(56.291+n, 84.43+n), LatLng(56.3+n, 84.44+n), LatLng(56.295+n, 84.45+n)],
              color: n<0.5 ? Colors.blue : Colors.red,
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(56.3+n, 84.4+n),
              radius: 100,
              useRadiusInMeter: true,
            ),
          ],
        ),
      ],
    );
  }
}



