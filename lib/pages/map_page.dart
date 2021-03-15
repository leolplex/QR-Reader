import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings);
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}
