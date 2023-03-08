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
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<LottiePageProvider>();
    final providerRead = context.read<LottiePageProvider>();
    final provider = context.read<ThemeNotifier>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await controller.animateTo(!isLight ? 0.5 : 1,
                  duration: DurationItems.durationNormal());
              isLight = !isLight;
              provider.changeTheme();
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath,
                repeat: false, controller: controller),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerRead.changeVisible();
          controller.animateTo( providerWatch.currentVisibilty ? 0 : 1);
        },
      ),
      body: Center(
        child: AnimatedContainer(
          duration: DurationItems.durationNormal(),
          width: MediaQuery.of(context).size.height * 0.4,
          height:providerWatch.currentVisibilty ? kZero : 150,
          color: Colors.red,
        ),
      ),
    );
  }
}
