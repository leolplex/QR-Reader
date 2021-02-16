import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String type;

  const ScanTiles({@required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteById(scans[i].id);
              },
              child: ListTile(
                leading: Icon(
                  this.type == 'http' ? Icons.home_outlined : Icons.map_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[i].value),
                subtitle: Text(scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => print(scans[i].id),
              ),
            ));
  }
}
