import 'package:flutter/material.dart';

class CarItem {
  final String title;
  final double price;
  final String path;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;

  CarItem(
      {required this.title,
        required this.price,
        required this.path,
        required this.color,
        required this.gearbox,
        required this.fuel,
        required this.brand});
}

CarsList allCars = CarsList(cars: [
  CarItem(
      title: 'Honda Civic 2018',
      price: 400,
      color: 'Grey',
      gearbox: '4',
      fuel: '4L',
      brand: 'Honda',
      path: 'images/civic.jpg'),
  CarItem(
      title: 'Honda Mobilio Matic',
      price: 250,
      color: 'Grey',
      gearbox: '6',
      fuel: '19L',
      brand: 'Honda',
      path: 'images/mobilio.jpg'),
  CarItem(
      title: 'Daihatsu All New Avanza 2023',
      price: 280,
      color: 'Red',
      gearbox: '5',
      fuel: '6L',
      brand: 'Daihatsu',
      path: 'images/all_new_avanza.jpg'),
  CarItem(
      title: 'Honda Brio Matic',
      price: 220,
      color: 'Grey',
      gearbox: '5',
      fuel: '6L',
      brand: 'Honda',
      path: 'images/honda_brio.jpg'),
  CarItem(
      title: 'Toyota Kijang Innova 2.0G',
      price: 330,
      color: 'White',
      gearbox: '6',
      fuel: '10L',
      brand: 'Toyota',
      path: 'images/innova_kapsul.jpg'),
  CarItem(
      title: 'Toyota Kijang Innova Diesel 2.4V',
      price: 380,
      color: 'Grey',
      gearbox: '6',
      fuel: '6L',
      brand: 'Toyota',
      path: 'images/innova_reborn.jpg'),
]);

class CarsList {
  List<CarItem> cars;

  CarsList({required this.cars});
}