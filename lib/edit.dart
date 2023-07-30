import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:persewaan_mobil/home.dart';
class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.nama, required this.nik, required this.id});
  final String nama;
  final String nik;
  final int id;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var namaController = TextEditingController();
  var nikController = TextEditingController();

  // Input formatter to allow only numeric input and a maximum length of 16 characters
  final nikInputFormatter = FilteringTextInputFormatter.digitsOnly;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaController.text = widget.nama;
    nikController.text = widget.nik;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Data")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(hintText: "Nama Penyewa"),
            ),
            TextField(
              controller: nikController,
              decoration: InputDecoration(hintText: "Nomor NIK"),
              inputFormatters: [LengthLimitingTextInputFormatter(16), nikInputFormatter],
              keyboardType: TextInputType.number, // Set keyboard type to numeric
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                // Check if the "NIK" field has exactly 16 digits
                if (nikController.text.length == 16) {
                  var id = widget.id;
                  Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  };
                  var response = await http.put(
                      Uri.parse('http://localhost:1337/api/penyewas/$id'),
                      headers: headers,
                      body: jsonEncode({
                        "data": {
                          "nama": namaController.text,
                          "nik": nikController.text,
                        }
                      }));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                } else {
                  // Show a snackbar or an alert indicating the incorrect NIK format
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('NIK harus terdiri dari 16 digit.')),
                  );
                }
              },
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
