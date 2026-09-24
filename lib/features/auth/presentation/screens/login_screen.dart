
import 'package:flutter/material.dart';

import '../../data/auth_api.dart';
import 'register_screen.dart';
import '../../../dashboard/presentation/screens/dashboard_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthApi _authApi = AuthApi();

  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  // ============================================================
  // LOGIN
  // ============================================================

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _authApi.login(
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) return;

      final fullName =
          result['fullName']?.toString() ?? '';

      final role =
          result['role']?.toString().toUpperCase() ?? 'USER';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Karibu $fullName! Role: $role',
          ),
        ),
      );

      // ========================================================
      // ROLE-BASED DASHBOARD
      // ========================================================

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardRouter(
            user: result,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().replaceFirst(
              'Exception: ',
              '',
            ),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // ============================================================
  // PHONE VALIDATION
  // ============================================================

  String? _phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Weka namba ya simu';
    }

    if (value.trim().length < 10) {
      return 'Weka namba sahihi ya simu';
    }

    return null;
  }

  // ============================================================
  // PASSWORD VALIDATION
  // ============================================================

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Weka password';
    }

    return null;
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 30),

              // ------------------------------------------------
              // ICON
              // ------------------------------------------------

              const Icon(
                Icons.lock_person,
                size: 72,
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // TITLE
              // ------------------------------------------------

              const Text(
                'Karibu WINGA KIGANJANI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Ingia kwenye akaunti yako',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 32),

              // ------------------------------------------------
              // PHONE
              // ------------------------------------------------

              TextFormField(
                controller: _phoneController,
                validator: _phoneValidator,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '0712345678',
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // PASSWORD
              // ------------------------------------------------

              TextFormField(
                controller: _passwordController,
                validator: _passwordValidator,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  if (!_isLoading) {
                    _login();
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    tooltip: _obscurePassword
                        ? 'Show password'
                        : 'Hide password',
                    onPressed: () {
                      setState(() {
                        _obscurePassword =
                            !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ------------------------------------------------
              // LOGIN BUTTON
              // ------------------------------------------------

              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed:
                      _isLoading ? null : _login,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 16),

              // ------------------------------------------------
              // REGISTER BUTTON
              // ------------------------------------------------

              OutlinedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const RegisterScreen(),
                          ),
                        );
                      },
                child: const Text(
                  'CREATE ACCOUNT',
                ),
              ),

              const SizedBox(height: 20),

              // ------------------------------------------------
              // INFO
              // ------------------------------------------------

              const Text(
                'Vendor, Rider na Agent wanaweza '
                'kutumia akaunti zao kuingia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

