import 'package:flutter/material.dart';
import 'package:profile_app/presentation/provider/change_notifier_providers.dart';
import 'package:profile_app/presentation/view/splash/splash.dart';
import 'package:provider/provider.dart';
import 'base/navigator_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget is the root
    return MultiProvider(
      providers: ChangeNotifierProviders.list,
      child:  MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorKey.navKey,
            home: const SplashScreen(),
      ),

    );
  }
}