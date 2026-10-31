import 'package:final_e_commerce/views/registerbage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_e_commerce/models/loginrequest.dart';
import 'package:final_e_commerce/notifiers/loginNotifier.dart';
import 'package:final_e_commerce/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  final Color orange = const Color(0xFFFF6B35);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              Center(
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  'Login to continue shopping with us',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),

              const SizedBox(height: 45),

              const Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 23),

              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: loginState.isLoading
                      ? null
                      : () {
                          final body = Loginrequest(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );

                          ref
                              .read(loginNotifierProvider.notifier)
                              .loginUser(body);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: loginState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              if (loginState.hasError) ...[
                const SizedBox(height: 15),
                Text(
                  loginState.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ],

              if (loginState.hasValue && loginState.value != null) ...[
                const SizedBox(height: 15),
                const Text(
                  'Login Successful!',
                  style: TextStyle(color: Colors.green),
                ),
              ],

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 30),
                  label: const Text(
                    'Continue with Google',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                      ),
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
