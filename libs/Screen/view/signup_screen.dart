import 'package:flutter/material.dart';
import '/Helper/pos_text_formfield.dart';
import '/Helper/style.dart';
import 'package:final_app/view/Widgets/signin_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signup() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Account Created Successfully")),
      );

      // Navigate to Sign In screen after successful registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SigninScreen()),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylecolor.background,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Email
              PosTextFormfield(
                controller: _emailController,
                label: "Email",
                hintText: "Enter your email",
                prefixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email is required";
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Phone
              PosTextFormfield(
                controller: _phoneController,
                label: "Phone Number",
                hintText: "Enter your phone number",
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Phone number is required";
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) return "Phone must contain only numbers";
                  if (value.length < 8) return "Phone must be at least 8 digits";
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password
              PosTextFormfield(
                controller: _passwordController,
                label: "Password",
                hintText: "Enter your password",
                prefixIcon: const Icon(Icons.lock),
                isObscure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Password is required";
                  if (value.length < 6) return "Password must be at least 6 characters";
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password
              PosTextFormfield(
                controller: _confirmPasswordController,
                label: "Confirm Password",
                hintText: "Re-enter your password",
                prefixIcon: const Icon(Icons.lock_outline),
                isObscure: true,
                validator: (value) {
                  if (value != _passwordController.text) return "Passwords do not match";
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Sign Up Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 70, 7, 125),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _signup,
                child: const Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Already Have an Account
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SigninScreen()),
                  );
                },
                child: const Text(
                  "Already have an account? Sign In",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
