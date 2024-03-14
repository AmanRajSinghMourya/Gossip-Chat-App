import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/pages.dart';
import 'package:gossip/Config/theme.dart';
import 'package:gossip/Screens/SplashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gossip/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pagePath,
      debugShowCheckedModeBanner: false,
      title: 'Gossip',
      theme: ThemeData(useMaterial3: true),
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
