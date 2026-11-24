import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapProfile extends StatefulWidget {
  const MapProfile({super.key});

  @override
  State<MapProfile> createState() => MapProfileState();
}

class MapProfileState extends State<MapProfile> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const LatLng _destinoIfal = LatLng(-9.74556307057823, -36.631331541524695);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: _destinoIfal,
    zoom: 20,
  );

  static const CameraPosition _Ifal = CameraPosition(
    bearing: 192,
    target: _destinoIfal,
    zoom: 20,
  );

  LatLng? _usuario;
  double? _distancia;
  Set<Marker> _marcadores = {};

  @override
  void initState() {
    super.initState();
    _obterLocalizacao();
  }

  //serviço de localização ativo
  Future<void> _obterLocalizacao() async {
    bool servicoAtivo = await Geolocator.isLocationServiceEnabled();
    if (!servicoAtivo) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ative o serviço de localização')),
      );
      return;
    }

    //permissões
    LocationPermission permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permissão de localização negada.')),
        );
        return;
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissão negada permanentemente.'),),
      );
      return;
    }

    //Localizaçao atual
    Position posicao = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    LatLng userLatLng = LatLng(posicao.latitude, posicao.longitude);

    //distância
    double distanciaMetros = Geolocator.distanceBetween(
      userLatLng.latitude,
      userLatLng.longitude,
      _destinoIfal.latitude,
      _destinoIfal.longitude,
    );
    double distanciaKm = distanciaMetros / 1000;

    setState(() {
      _usuario = userLatLng;
      _distancia = distanciaKm;
      _marcadores = {
        Marker(
          markerId: const MarkerId('usuario'),
          position: userLatLng,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: InfoWindow(
            title: 'Sua Posição.',
            snippet: 'Distãcia até o IFAL: ${distanciaKm.toStringAsFixed(2)} km',
          ),
        ),
        Marker(
          markerId: const MarkerId('ifal'),
          position: _destinoIfal,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(
            title: 'IFAL',
            snippet: 'Distância: ${distanciaKm.toStringAsFixed(2)} km',
          ),
        ),
      };
    });



    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: userLatLng, zoom: 16),
      ),
    );

  }

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
        markers: _marcadores,
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