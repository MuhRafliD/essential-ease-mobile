import 'package:flutter/material.dart';
import 'package:essential_ease/widgets/left_drawer.dart';
import 'package:essential_ease/widgets/globals.dart' as globals;

class DataItemPage extends StatefulWidget {
  const DataItemPage({super.key});

  @override
  State<DataItemPage> createState() => _DataItemState();
}

class _DataItemState extends State<DataItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Item'),
      ),
      drawer: const LeftDrawer(),
      body: Center(
          child: ListView.builder(
            itemCount: globals.semuaItem.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.blueGrey,
                    child: ListTile(
                      title: Text(globals.semuaItem[index].name),
                      subtitle: Text(globals.semuaItem[index].description),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Jumlah : ${globals.semuaItem[index].amount}")
                          ]),
                    )),
              );
            }),
          )),
    );
  }
}