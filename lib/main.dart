import 'package:flutter/material.dart';
import 'package:flutter_midterms/pages/home.dart';
import 'package:flutter_midterms/pages/review.dart';
import 'package:flutter_midterms/db/database.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/review': (context) => Review(),
    },
  ));
  Database? database = await DatabaseHelper.instance.database;
}
