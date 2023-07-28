import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
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
    _decideWhichRouteToNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("SPLASH")),
    );
  }

  Future<void> _decideWhichRouteToNavigate() async {
    final String _initialRoute = await _controller.getInitialRoute();
    await Future.delayed(const Duration(seconds: 2));
    _navigateToRoute(_initialRoute);
  }

  void _navigateToRoute(String routePath) {
    Navigator.of(context).pushReplacementNamed(routePath);
  }
}
