import 'package:carros/entities/carro.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  await Permission.location.request();
}

class MapaPage extends StatefulWidget {
  final Carro carro;

  const MapaPage(this.carro, {Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.carro.nome ?? 'Carro'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: latLng(),
          zoom: 17,
        ),
        markers: Set.of(_getMarkers()),
      ),
    );
  }

  latLng() {
    return widget.carro.latLng();
  }

  List<Marker> _getMarkers() {
    return [
      Marker(
        markerId: const MarkerId("1"),
        position: latLng(),
        infoWindow: InfoWindow(
          title: widget.carro.nome,
          snippet: "Fábrica do carro ${widget.carro.nome!}",
          onTap: () {
            print("Clicou na janela");
          }
        ),
        onTap: () {
          print("Clicou no marcador");
        }
      )
    ];
  }
}
