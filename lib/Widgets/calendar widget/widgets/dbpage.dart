import 'package:flutter/material.dart';

class Dbpage extends StatefulWidget {
  const Dbpage({super.key});

  @override
  State<Dbpage> createState() => _DbpageState();
}

class _DbpageState extends State<Dbpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('data'),
            Wrap(
              spacing: 8.0, // Replace with your desired spacing between items
              children: List.generate(10, (index) {
                // Replace this with your item widget
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  margin: EdgeInsets.all(8.0),
                );
              }),
            ),
            ElevatedButton(
                onPressed: () async {
                  // await DBProvider.db
                  //     .createTable()
                  //     .then((value) => print('started'));
                },
                child: Text("CheckDB"))
          ],
        ),
      ),
    );
  }
}
