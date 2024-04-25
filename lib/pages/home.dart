import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Review'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Details(),
        ],
      )),
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            color: Colors.blue,
            height: 200,
            width: 300,
            child: Column(
              children: [
                const Text(
                  'The Restaurant',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Location : My house',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/review");
                    },
                    icon: const Icon(Icons.mail),
                    label: const Text("Write a review"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
