
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';
import 'MapDataBase.dart';
import 'package:uuid/uuid.dart';

class PolylineMap extends StatelessWidget {
  var mypolylines;
  final double x;
  PolylineMap(this.mypolylines, this.x);
  @override
  Widget build(BuildContext context) {
    var uuid = Uuid();
    var v1 = uuid.v1();
    var cord1=56.291+x;
    var cord2=84.43+x;
    var cord3=56.3+x;
    var cord4=84.44+x;
    var cord5=56.295+x;
    var cord6=84.45+x;
    var color;
    x<0.25?color='blue':color='red';
    var cords = cord1.toString()+', '+cord2.toString()+'; '+cord3.toString()+', '+cord4.toString()+'; '+cord5.toString()+', '+cord6.toString();
    final now = DateTime.now();
    SQLHelperMap().createItemPoligon(v1, 'Polyline', cords, color, now.toString());
    return PolylineLayer(
        polylines: mypolylines,
    );
  }
}
