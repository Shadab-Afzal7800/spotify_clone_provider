import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/provider/category_provider.dart';
import 'package:spotify_clone/screens/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CategoryProvider())],
        child: const MaterialApp(
          home: BottomNavBar(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
