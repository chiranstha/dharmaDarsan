import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Riverpod/Repository/connection_state.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Internet Connectivity Checker'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            const isConnected = true;
            return const Center(
              child: Text(
                isConnected
                    ? 'Connected to the internet'
                    : 'No internet connection',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}

// final connectivityControllerProvider =
//     StateNotifierProvider<ConnectivityController, bool>(
//   (ref) => ConnectivityController(),
// );
