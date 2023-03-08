import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_animations/lottie_page_provider.dart';
import 'package:lottie_animations/product/constants/duration_items.dart';
import 'package:lottie_animations/product/constants/lottie_items.dart';
import 'package:lottie_animations/product/global/theme_notifier_provider.dart';
import 'package:provider/provider.dart';

const double kZero = 0;

class LottiePage extends StatefulWidget {
  const LottiePage({Key? key}) : super(key: key);

  @override
  State<LottiePage> createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<LottiePageProvider>();
    final providerRead = context.read<LottiePageProvider>();
    final providerr = context.read<ThemeNotifier>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await controller.animateTo(!isLight ? 0.5 : 1,
                  duration: DurationItems.durationNormal());
              isLight = !isLight;
              providerr.changeTheme();
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath,
                repeat: false, controller: controller),
          ),
        ],
      ),
      floatingActionButton: Selector<LottiePageProvider,bool>(
          builder: (context, value, child){
            return value ? FloatingActionButton(
              onPressed: () {
                providerRead.changeVisible();
                controller.animateTo(0);
              },
            )
                : FloatingActionButton(
              onPressed: () {
                providerRead.changeVisible();
                controller.animateTo(1);
              },
            );
          },
          selector: (context, provider){
            return provider.currentVisibilty;
          }
      ),
      body: Center(
        child: Selector<LottiePageProvider, bool>(
          builder: (context, value, child) {
            return value
                ? AnimatedContainer(
                    duration: DurationItems.durationNormal(),
                    width: MediaQuery.of(context).size.height * 0.4,
                    height: kZero,
                    color: Colors.red,
                  )
                : AnimatedContainer(
                    duration: DurationItems.durationNormal(),
                    width: MediaQuery.of(context).size.height * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.red,
                  );
          },
          selector: (context, provider) {
            return provider.currentVisibilty;
          },
        ),
      ),
    );
  }
}
