import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'MapDataBase.dart';
import 'package:uuid/uuid.dart';

class CircleMap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double x=Random().nextInt(10)/20;
    var cord1=56.3+x;
    var cord2=84.4+x;
    var cords = cord1.toString()+', '+cord2.toString();
    final now = DateTime.now();
    SQLHelperMap().createItemPoligon(cords, 'green', now);
    return CircleLayer(
        circles: [
          CircleMarker(
            point: LatLng(56.3+x, 84.4+x),
            radius: 1000,
            useRadiusInMeter: true,
            ),
        ]
    );
  }
}
