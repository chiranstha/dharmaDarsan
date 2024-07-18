// import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class ConnectivityController extends StateNotifier<bool> {
//   ConnectivityController() : super(false) {
//     initialize();
//   }

//   void initialize() async {
//     dynamic  result =
//         await (Connectivity().checkConnectivity());
//     state = result != ConnectivityResult.none;
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       state = result != ConnectivityResult.none;
//     });
//   }
// }
