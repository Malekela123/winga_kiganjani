
import 'package:flutter/material.dart';

import 'student_dashboard_screen.dart';
import 'vendor_dashboard_screen.dart';
import 'rider_dashboard_screen.dart';
import 'agent_dashboard_screen.dart';

class DashboardRouter extends StatelessWidget {
  final Map<String, dynamic> user;

  const DashboardRouter({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final role =
        user['role']?.toString().toUpperCase() ?? 'USER';

    switch (role) {
      case 'VENDOR':
        return VendorDashboardScreen(user: user);

      case 'RIDER':
        return RiderDashboardScreen(user: user);

      case 'AGENT':
        return AgentDashboardScreen(user: user);

      case 'USER':
      default:
        return StudentDashboardScreen(user: user);
    }
  }
}

