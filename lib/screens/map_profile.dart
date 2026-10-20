import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProfile extends StatefulWidget {
  const MapProfile({super.key});

  @override
  State<MapProfile> createState() => MapProfileState();
}

class MapProfileState extends State<MapProfile> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-9.74556307057823, -36.631331541524695),
    zoom: 25,
  );

  static const CameraPosition _Ifal = CameraPosition(
    bearing: 192,
    target: LatLng(-9.74556307057823, -36.631331541524695),
    zoom: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Mapa'),
      ),


      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goIfal,
        label: const Text('Sua localização', style: TextStyle(color: Color(0xFFFFFFFF)),),
        icon: const Icon(Icons.pin_drop, color: Color(0xFFFFFFFF),),
      ),
    );
  }

  Future<void> _goIfal() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_Ifal));
  }
}