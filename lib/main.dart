import 'package:flutter/material.dart';
import 'package:lottie_animations/lottie_page.dart';
import 'package:lottie_animations/lottie_page_provider.dart';
import 'package:lottie_animations/product/global/theme_notifier_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider<LottiePageProvider>(create: (_) => LottiePageProvider()),
  ],
  child: const MyApp(),
  )
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: context.watch<ThemeNotifier>().currentTheme,
        home: const LottiePage());
  }
}
