import 'package:admin_dashboard/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'dart:io'; // To check the platform
import 'package:window_size/window_size.dart';
// The actual package to control window size

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  Hive.init(path);
  await Hive.openBox('mybox');

  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    setWindowTitle('My Linux App');
    setWindowMinSize(const Size(600, 600));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024), // Adjust to your design spec
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: Routes().router,
      ),
    );
  }
}
