import 'package:admin_dashboard/util/routes/routes.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();

  // windowManager.setMinimumSize(const Size(500, 500));
  // windowManager.setResizable(false);
  await DesktopWindow.setMinWindowSize(Size(600, 600));
  await DesktopWindow.setMaxWindowSize(Size(600, 600));

  print(
    "*******************************${await DesktopWindow.getWindowSize()}",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: Routes().router,
    );
  }
}
