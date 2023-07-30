import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:persewaan_mobil/home.dart';

class CreatePenyewa extends StatefulWidget {
  const CreatePenyewa({super.key});

  @override
  State<CreatePenyewa> createState() => _CreatePenyewaState();
}

class _CreatePenyewaState extends State<CreatePenyewa> {
  var nama = TextEditingController();
  var nik = TextEditingController();
  // Input formatter to allow only numeric input and a maximum length of 16 characters
  final nikInputFormatter = FilteringTextInputFormatter.digitsOnly;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Penyewa")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: nama,
              decoration: InputDecoration(hintText: "Nama Penyewa"),
            ),
            TextField(
              controller: nik,
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
                if (nik.text.length == 16) {
                  Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  };
                  var response = await http.post(
                      Uri.parse('http://localhost:1337/api/penyewas'),
                      headers: headers,
                      body: jsonEncode({
                        "data": {
                          "nama": nama.text,
                          "nik": nik.text,
                        }
                      }));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                }else {
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
