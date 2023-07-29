import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_git/create.dart';
//import 'package:flutter_git/edit.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Penyewa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Data Penyewa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int total = 0;
  var dataJson;

  void _getDataFromStrapi() async{
    var response = await http.get(Uri.parse("http://localhost:1337/api/penyewas"));
    dataJson = await jsonDecode(response.body);
    print(dataJson["meta"]["pagination"]["total"]);
    setState(() {
      total = dataJson["meta"]["pagination"]["total"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: total,
          itemBuilder: (context, index){
            return ListTile(
              title:
              Text(dataJson["data"][index]["attributes"]["nama"]),
              leading: Icon(Icons.person_outline),
              trailing: IconButton(onPressed: () async{
                var id = dataJson["data"][index]["id"];
                var response = await http.delete(Uri.parse(
                    "http://localhost:1337/api/penyewas/$id"));
                _getDataFromStrapi();
              }, icon: Icon(Icons.delete)),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDataFromStrapi,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
