// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'adtobs.dart';
import 'bstoad.dart';

class DateConvertPage extends StatefulWidget {
  const DateConvertPage({super.key});

  @override
  State<DateConvertPage> createState() => _DateConvertPageState();
}

class _DateConvertPageState extends State<DateConvertPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('मिति परिवर्तन'),
        backgroundColor: const Color(0xFFdb1304),
        elevation: 0,
      ),
      body: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.black,
            indicatorColor: const Color(0xFFdb1304),
            labelColor: const Color(0xFFdb1304),
            controller: tabController,
            tabs: const [
              Tab(
                text: 'वि.सं. बाट ई.सं.',
              ),
              Tab(
                text: 'ई.सं. बाट वि.सं.',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [bstoadpage(), adtobspage()],
            ),
          ),
        ],
      ),
    );
  }
}
