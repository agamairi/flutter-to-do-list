import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/screens/home_page.dart';
import 'package:to_do_app/utils/notification_service.dart';

Future<void> main() async {
  // initializing the hive database
  await Hive.initFlutter();
  // opening up a box
  var box = await Hive.openBox('myBox');

  // notification service
  await NotificationService.init();

  runApp(const MyApp());
  // schedule notification every 4 hours
  Timer.periodic(const Duration(hours: 4), (timer) {
    NotificationService.showNotification();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      //darkTheme: ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
