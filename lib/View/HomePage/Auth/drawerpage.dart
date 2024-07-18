// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class DrawerPage extends ConsumerStatefulWidget {
//   const DrawerPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DrawerPageState();
// }

// class _DrawerPageState extends ConsumerState<DrawerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Drawer Page"),
//         backgroundColor: Colors.red,
//       ),
//       body: Center(child: Text("Drawer Page")),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:sizer/sizer.dart';

openDrawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.6,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // DrawerHeader(
        //   child: Text('Drawer Header'),
        //   decoration: BoxDecoration(
        //     color: Colors.blue,
        //   ),
        // ),

        UserAccountsDrawerHeader(
          currentAccountPicture: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 7.w,
                backgroundColor: Colors.white,
                child: Text(
                  "PP",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // backgroundImage: const AssetImage(
                //   'assets/images/nopic.png',
                // ),
              ),
            ],
          ),
          accountName: Text(
            "Prasanna Poudel",
            style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          // accountEmail: Text(""),
          accountEmail: Chip(
              backgroundColor: Colors.blue.shade400,
              label: Text(
                "लग आउट",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              )),

          decoration: BoxDecoration(
            color: mainColor,
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}
