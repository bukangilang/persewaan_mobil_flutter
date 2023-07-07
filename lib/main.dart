import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:indocars/MyProfil.dart';
import 'MyProfil.dart';
import 'Tampilan_mobil.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Home(),
      routes: <String, WidgetBuilder>{
        '/page1' : (BuildContext context) => new Home(),
        '/page2' : (BuildContext context) => new MyProfil(),
        '/page3' : (BuildContext context) => new Tampilanmobil(),
      },
    ),
  );
}

class Home extends StatelessWidget {
  String teks='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Go Rent'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: (){
                Navigator.pushNamed(context, '/page2');
              }
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Container(
              // width: 50,
              child: Image.asset('images/go_rent.jpg',
                  fit: BoxFit.fill,
                height: 250.0,
                width: 300.0,
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(50.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                      hintText: 'Masukan Lokasi Yang Diinginkan',
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ElevatedButton(
                onPressed: (){
                  var route = new MaterialPageRoute(builder: (context)=> Tampilanmobil(),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text(
                  'Cari',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


