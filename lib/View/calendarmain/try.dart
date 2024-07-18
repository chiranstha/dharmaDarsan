// import 'package:flutter/material.dart';

// class MyListView extends StatefulWidget {
//   @override
//   _MyListViewState createState() => _MyListViewState();
// }

// class _MyListViewState extends State<MyListView> {
//   final GlobalKey _key1 = GlobalKey();
//   final GlobalKey _key2 = GlobalKey();
//   final GlobalKey _key3 = GlobalKey();
//   final GlobalKey _key4 = GlobalKey();
//   final GlobalKey _key5 = GlobalKey();
//   final GlobalKey _key6 = GlobalKey();
//   final GlobalKey _key7 = GlobalKey();
//   final GlobalKey _key8 = GlobalKey();
//   final GlobalKey _key9 = GlobalKey();
//   final GlobalKey _key10 = GlobalKey();
//   final GlobalKey _key11 = GlobalKey();
//   final GlobalKey _key12 = GlobalKey();
//   final GlobalKey _key13 = GlobalKey();

//   // Add as many keys as you have items in your list

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollToItem(11); // 8 is the index of the item to scroll to
//     });
//   }

//   void _scrollToItem(int index) {
//     final key = _getGlobalKeyByIndex(index);
//     if (key != null) {
//       Scrollable.ensureVisible(
//         key.currentContext!,
//         duration: Duration(seconds: 2),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   GlobalKey _getGlobalKeyByIndex(int index) {
//     switch (index) {
//       case 0:
//         return _key1;
//       case 1:
//         return _key2;
//       case 2:
//         return _key3;
//       // Add a case for each item in your list
//       case 8:
//         return _key8;
//       case 11:
//         return _key11;
//       default:
//         return _key9;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scroll to item'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 300,
//               color: Colors.red,
//             ),
//             ListView(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 ListTile(
//                   key: _key1,
//                   title: Text('Item 1'),
//                   subtitle: Text("sdaddwd"),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key2,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 2'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key3,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key4,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key5,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key6,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key7,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key8,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key9,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 ListTile(
//                   key: _key10,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),
//                 Column(
//                   key: _key11,
//                   children: [Text("Hello")],
//                 ),

//                 // ListTile(
//                 //   key: _key11,
//                 //   subtitle: Text("sdaddwd"),
//                 //   title: Text('Item 3'),
//                 //   isThreeLine: true,
//                 // ),

//                 ListTile(
//                   key: _key12,
//                   subtitle: Text("sdaddwd"),
//                   title: Text('Item 3'),
//                   isThreeLine: true,
//                 ),

//                 // Add a ListTile for each item in your list
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
