import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/presentation/home/controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = Inject.get<SplashScreenController>()!;

  @override
  void initState() {
    super.initState();
    _controller.initUser().then(
          (value) => Navigator.of(context)
              .pushReplacementNamed(HomeModule.routePaths.home),
        );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("SPLASH")),
    );
  }
}
