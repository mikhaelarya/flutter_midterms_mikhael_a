import 'package:flutter/material.dart';
import 'package:flutter_midterms/db/database.dart';
import 'package:sqflite/sqflite.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final nameController = TextEditingController();
  final reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Write Your Review")),
      backgroundColor: Color.fromARGB(255, 241, 253, 129),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                const Text("Name"),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insert your name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Review"),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: reviewController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your review',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () async {
                      Database? database =
                          await DatabaseHelper.instance.database;
                      await database?.insert('restaurant', {
                        'name': nameController.text,
                        'review': reviewController.text
                      });

                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text('Send review'))
              ],
            )),
      ),
    );
  }
}
