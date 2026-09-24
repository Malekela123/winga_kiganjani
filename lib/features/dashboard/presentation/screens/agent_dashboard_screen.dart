
import 'package:flutter/material.dart';

import '../widgets/dashboard_service_card.dart';
import '../widgets/winga_wallet_card.dart';

class AgentDashboardScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const AgentDashboardScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final fullName =
        user['fullName']?.toString() ?? 'Agent';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Habari, $fullName 👋',
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'Simamia huduma za Winga Kiganjani.',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          WingaWalletCard(
            onTap: () {},
          ),

          const SizedBox(height: 24),

          const Text(
            'Agent Services',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.25,
            children: [
              DashboardServiceCard(
                icon: Icons.people,
                title: 'Customers',
                subtitle: 'Simamia customers',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.swap_horiz,
                title: 'Transactions',
                subtitle: 'Transactions',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.miscellaneous_services,
                title: 'Services',
                subtitle: 'Huduma za agent',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.bar_chart,
                title: 'Reports',
                subtitle: 'Ripoti',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.account_balance_wallet,
                title: 'Winga Wallet',
                subtitle: 'Wallet yako',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.person,
                title: 'Profile',
                subtitle: 'Wasifu wako',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

