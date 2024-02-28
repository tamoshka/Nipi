
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';
import 'MapDataBase.dart';
import 'package:uuid/uuid.dart';


class CircleMap extends StatelessWidget {
  var mycircle;
  final double x;
  CircleMap(this.mycircle, this.x);
  Future<void> createText(String v1, String cords) async {
    SQLHelperMap().createItemPoligon(v1, 'Circle', cords, "green", DateTime.now().toString());
  }
  @override

  Widget build(BuildContext context) {
    var uuid = Uuid();
    var v1 = uuid.v1();
    var cord1=56.3+x;
    var cord2=84.4+x;
    var cords = cord1.toString()+', '+cord2.toString();
    createText(v1, cords);
    return CircleLayer(
        circles: mycircle
    );
  }
}
