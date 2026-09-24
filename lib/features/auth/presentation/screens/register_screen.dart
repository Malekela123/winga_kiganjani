
import 'package:flutter/material.dart';

import '../../data/auth_api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final AuthApi _authApi = AuthApi();

  String _selectedRole = 'VENDOR';

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final email = _emailController.text.trim();

      final result = await _authApi.register(
        fullName: _fullNameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: email.isEmpty ? null : email,
        password: _passwordController.text,
        role: _selectedRole,
      );

      if (!mounted) return;

      final role = result['role']?.toString() ?? _selectedRole;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Akaunti ya $role imesajiliwa kikamilifu!',
          ),
        ),
      );

      Navigator.pop(context, result);
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

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Sehemu hii inahitajika';
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Weka namba ya simu';
    }

    if (value.trim().length < 10) {
      return 'Weka namba sahihi ya simu';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Weka password';
    }

    if (value.length < 8) {
      return 'Password iwe na angalau characters 8';
    }

    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Thibitisha password';
    }

    if (value != _passwordController.text) {
      return 'Password hazifanani';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Icon(
                Icons.person_add_alt_1,
                size: 64,
              ),

              const SizedBox(height: 12),

              const Text(
                'Jiunge na WINGA KIGANJANI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Chagua aina ya akaunti unayotaka kutumia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Aina ya Akaunti',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              SegmentedButton<String>(
                segments: const [
                  ButtonSegment<String>(
                    value: 'VENDOR',
                    icon: Icon(Icons.store),
                    label: Text('Vendor'),
                  ),
                  ButtonSegment<String>(
                    value: 'RIDER',
                    icon: Icon(Icons.delivery_dining),
                    label: Text('Rider'),
                  ),
                  ButtonSegment<String>(
                    value: 'AGENT',
                    icon: Icon(Icons.support_agent),
                    label: Text('Agent'),
                  ),
                ],
                selected: {_selectedRole},
                onSelectionChanged: (selection) {
                  setState(() {
                    _selectedRole = selection.first;
                  });
                },
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: _fullNameController,
                validator: _requiredValidator,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Mfano: Joshua Malekela',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _phoneController,
                validator: _phoneValidator,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '0712345678',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email (Optional)',
                  hintText: 'example@email.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _passwordController,
                validator: _passwordValidator,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _confirmPasswordController,
                validator: _confirmPasswordValidator,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword =
                            !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'REGISTER',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
