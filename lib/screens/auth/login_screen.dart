import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ইমেইল লিখুন।'),
        ),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('পাসওয়ার্ড লিখুন।'),
        ),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  void openSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Column(
                children: [
                  const Text(
                    'Bondhu',
                    style: TextStyle(
                      color: Color(0xFF1877F2),
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'বন্ধুত্বের নতুন ঠিকানা',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 35),
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'লগইন করুন',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: emailController,
                            keyboardType:
                                TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'ইমেইল',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'পাসওয়ার্ড',
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword =
                                        !obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: FilledButton(
                              onPressed: login,
                              child: const Text(
                                'লগইন',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'পাসওয়ার্ড ভুলে গেছেন?',
                            ),
                          ),
                          const Divider(height: 25),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: openSignup,
                              child: const Text(
                                'নতুন অ্যাকাউন্ট তৈরি করুন',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
