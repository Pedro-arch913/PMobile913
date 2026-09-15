import 'package:teste01/db/shared_prefs.dart';
import 'package:teste01/Pages/home_page.dart';
import 'package:teste01/Pages/login_page.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();
  late Future<bool> _statusFuture;
  bool _navigated = false;
  @override
  void initState() {
    super.initState();
    _statusFuture = checkStatus();
  }
  Future<bool> checkStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    return await prefs.getUserStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: FutureBuilder<bool>(
        future: _statusFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Image.asset(
                'assets/imagens/logoapp.jpeg',
              ),
            );
          }
          if (snapshot.hasData && !_navigated) {
            _navigated = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              final bool status = snapshot.data!;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  status ? const HomePage() : const LoginPage(),
                ),
              );
            });
          }
          return Center(
            child: Image.asset(
              'assets/imagens/logoapp.jpeg',
            ),
          );
        },
      ),
    );
  }
}