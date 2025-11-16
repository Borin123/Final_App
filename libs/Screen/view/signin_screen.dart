import 'package:final_app/view/Widgets/onboarding_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_app/controllers/auth_controller.dart';
import 'package:final_app/view/Widgets/signup_screen.dart';
import 'package:final_app/view/Widgets/main_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final AuthController authController = Get.find<AuthController>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // ✅ Simple mock login logic
    if (email == "Borin26@gmail.com" && password == "123456") {
      authController.logIn(); // Save login state in GetStorage

      // 🔹 Navigate based on first time
      if (authController.firstTime) {
        Get.offAll(() => const OnboardingScreen());
      } else {
        Get.offAll(() => const MainScreen());
      }
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Failed"),
        content: const Text("Incorrect email or password!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const SizedBox(height: 80),

          // 🔹 Title
          Text(
            "Sign In",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 70, 7, 125),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // 🔹 Subtitle
          Center(
            child: Text(
              'Please sign in to continue to your awesome app!',
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),

          // 🔹 Email Field
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Password Field
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _togglePasswordVisibility,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 🔹 Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 70, 7, 125),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 🔹 Login Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 87, 14, 155),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: _login,
            child: Text(
              "Sign In",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromARGB(255, 251, 251, 251),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 🔹 Sign Up prompt
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 132, 29, 223),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const SignupScreen(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 400));
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
