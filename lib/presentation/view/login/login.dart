import 'package:flutter/material.dart';
import 'package:profile_app/base/base_constants.dart';
import 'package:profile_app/presentation/provider/login_provider.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // App Icon
                    const SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 80.0),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                '''Login With Your Email & Password''',
                                style: TextStyle(
                                  // fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Email Text Field
                    textbox(
                        label: 'Email',
                        hint: 'Enter your email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        onChanged: (val) => value.userName = val),
                    const SizedBox(height: 16),
                    // Password Text Field
                    textbox(
                        label: 'Password',
                        hint: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outlined),
                        isTextVisible: value.isShowPassword,
                        suffixIcon: IconButton(
                          icon: value.isShowPassword ? Icon(Icons.visibility_off_outlined) : Icon(Icons.remove_red_eye_outlined),
                          onPressed: () {
                            value.changeShowPassword();
                          },
                        ),
                        onChanged: (val) => value.password = val),
                    const SizedBox(height: 8),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add Forgot Password Logic
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ),
                    ),
                    // Login Button
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await value.authenticate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      'Login',
                    ),
                  ),
                  // Register Link
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account?"),
                        TextButton(
                          onPressed: () {
                            // Navigate to Register Page
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.indigo),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textbox(
    {required String label,
    required String hint,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required Function(String) onChanged,
    bool isTextVisible = true}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              label,
              style: const TextStyle(
                // fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      TextFormField(
        // Uses the isTextVisible to determine text obscuring
        obscureText: !isTextVisible,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: onChanged,
      ),
    ],
  );
}
