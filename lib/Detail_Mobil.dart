//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:persewaan_mobil/main.dart';
import 'Spesifik_Mobil.dart';

void _showSimpleDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Permintaan Terkirim",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}

class DetailMobil extends StatelessWidget {
  final String title;
  final double price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;

  DetailMobil(
      {required this.title,
        required this.price,
        required this.color,
        required this.gearbox,
        required this.fuel,
        required this.brand,
        required this.path});

  var itemCount = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Go Rent"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed:() {},
              icon: Icon(Icons.shopping_cart)
          ),
          if (itemCount > 0)
            Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                ),
                child: Text(
                  itemCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            )
        )
      ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,
              ),
              ),
              Text(
                brand,
                style: TextStyle(fontSize: 15,
                ),
              ),
              Hero(tag: title, child: Image.asset(path,
                fit: BoxFit.fill,
                height: 250.0,
                width: 400.0,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpesifikMobil(
                    name: '12 Month',
                    price: price * 12,
                    name2: 'Dollars',
                  ),
                  SpesifikMobil(
                    name: '6 Month',
                    price: price * 6,
                    name2: 'Dollars',
                  ),
                  SpesifikMobil(
                    name: '1 Month',
                    price: price * 1,
                    name2: 'Dollars',
                  )
                ],
              ),
              SizedBox(height: 20, width: 20,),
              Text(
                'SPECIFICATIONS',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20, width: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SpesifikMobil(
                    name: 'Color',
                    name2: color,
                    price: 1,
                  ),
                  SpesifikMobil(
                    name: "Gearbox",
                    name2: gearbox,
                    price: 1,
                  ),
                  SpesifikMobil(
                    name: 'Fuel',
                    name2: fuel,
                    price: 1,
                  )
                ],
              ),
              SizedBox(height: 10, width: 10,),
              ElevatedButton(
                onPressed: (){
                  _showSimpleDialog(context);
                  setState(() {
                    itemCount++;
                  });
                },
                child: Text(
                  'Rental',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
          ElevatedButton(
              child: const Text("Halaman Awal"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              }),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}