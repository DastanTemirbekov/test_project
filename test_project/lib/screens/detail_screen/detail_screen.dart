import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {Key? key,
      // required this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.adress})
      : super(key: key);
  // final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? adress;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //key: Key('AppBar'),
        centerTitle: true,
        title: Text('Info'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue[100],
        child: Column(
          children: [
            SizedBox(height: 150),
            Container(
             // key: Key('InfoContainer'),
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(20)),
              child: DataTable(
                //key: Key('DataTable'),
                columns: [
                  DataColumn(label: Text('name')),
                  DataColumn(label: Text('value'))
                ],
                rows: [
                  customDataRow('Name:', widget.name ?? ''),
                  customDataRow('Username:', widget.username ?? ''),
                  customDataRow('Email:', widget.email ?? ''),
                  customDataRow('Phone:', widget.phone ?? ''),
                  customDataRow('City:', widget.adress ?? ''),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              key: Key('printCustomWord'),
              onPressed: () => print('qwerty'),
              child: Icon(Icons.restart_alt_outlined),
            )
          ],
        ),
      ),
    );
  }

  customDataRow(String title, String description) {
    return DataRow(
      cells: [
        DataCell(
          Text(title),
        ),
        DataCell(Text(description)),
      ],
    );
  }
}
