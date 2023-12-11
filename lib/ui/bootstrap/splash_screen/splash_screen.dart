import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:visitor_mgnt/ui/user-ext/user_session_screen.dart';
import 'package:visitor_mgnt/usecases/auth/login_status_usecase.dart';

import 'package:visitor_mgnt/ui/bootstrap/initial/initial_screen.dart';

import '../../navigation/navigation_menu.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  bool _retrieveLoginStatus = false;
  final LoginStatusUseCase _loginStatusUseCase = GetIt.I.get();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bootStrap();
  }

  _bootStrap() {
    final result = _loginStatusUseCase.execute();

    if (result.isOk()) {
      if (result.ok().unwrap()) {
        Future(() => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const NavigationMenu(),
              ),
            ));
      } else {
        Future(() => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const UserSessionScreen(),
              ),
            ));
      }
    } else {
      setState(() {
        _retrieveLoginStatus = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _retrieveLoginStatus ? const InitialScreen() : const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.asset('assets/app_logo.png', fit: BoxFit.cover),
              ),
            )
          ),
        ),
      ),
    );
  }
}
