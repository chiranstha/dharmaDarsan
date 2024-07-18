// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamro_patro/Riverpod/Models/BlogModel.dart';
import 'package:hamro_patro/Riverpod/Models/BookModel.dart';
import 'package:hamro_patro/Riverpod/Models/EventModel.dart';
import 'package:hamro_patro/View/HomePage/welcomepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as hr;
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Riverpod/Navigator/appnavigator.dart';
import 'Riverpod/Navigator/fluronavigation.dart';
import 'Widgets/calendar widget/screen/my_calendar/calendar_controller.dart';
import 'Widgets/constants.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFFdb1304), // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogModelAdapter());
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(EventModelAdapter());

  await Hive.openBox<BookModel>('book');
  await Hive.openBox<BlogModel>('blog');
  await Hive.openBox<EventModel>('event');
  runApp(const hr.ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Routes.getRouter();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalendarController()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            onGenerateRoute: router.generator,
            navigatorKey: AppNavigatorService.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch: Colors.blue,
            ),
            home: const WelcomePage()),
      ),
    );
  }
}
