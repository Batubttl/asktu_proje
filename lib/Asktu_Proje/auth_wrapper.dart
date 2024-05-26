import 'package:asktu_proje/Asktu_Proje/batu_home.dart';
import 'package:asktu_proje/Asktu_Proje/batu_welcome.dart';
import 'package:flutter/material.dart';

import 'auth/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthService().user != null
        ? const HomeScreen()
        : const WelcomeScreen();
  }
}
