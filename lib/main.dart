import 'package:flutter/material.dart';
import 'package:gfrs/Provider/AttendieProvider.dart';
import 'package:gfrs/views/GaurdScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AttendieProvider(),
        )
      ],
      child: const MaterialApp(
        title: 'Guard FR System',
        debugShowCheckedModeBanner: false,
        home: GaurdAttendanceScreen(),
      ),
    );
  }
}
