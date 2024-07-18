import 'package:flutter/material.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bhajanpage.dart';

class BookMainPage extends ConsumerStatefulWidget {
  const BookMainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookMainPageState();
}

class _BookMainPageState extends ConsumerState<BookMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('नेपाली भजन'),
          backgroundColor: mainColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: [
              cardBuilder('पुजा विधी र मन्त्र', 1, context),
              cardBuilder('रुद्राक्ष महिमा', 2, context),
              cardBuilder('स्वपना फल', 3, context),
              cardBuilder('ध्यान दिने कुरा', 4, context),
              cardBuilder('हनुमान चलिसा नेपालीमा', 5, context),
              cardBuilder('भजनहरु', 6, context),
              cardBuilder('धार्मिक समान्य ज्ञान', 7, context)
            ],
          ),
        ));
  }
}

Widget cardBuilder(String data, int id, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BhajanPage(
              name: data,
              id: id,
            ),
          ));
    },
    child: Card(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset('assets/images/bhajan.jpg'),
          Text(
            data,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
