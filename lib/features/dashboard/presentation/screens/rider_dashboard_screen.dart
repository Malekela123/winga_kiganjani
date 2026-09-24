
import 'package:flutter/material.dart';

import '../widgets/dashboard_service_card.dart';
import '../widgets/winga_wallet_card.dart';

class RiderDashboardScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const RiderDashboardScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final fullName =
        user['fullName']?.toString() ?? 'Rider';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider Dashboard'),
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
            'Simamia deliveries zako.',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          WingaWalletCard(
            onTap: () {},
          ),

          const SizedBox(height: 24),

          const Text(
            'Delivery Management',
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
                icon: Icons.delivery_dining,
                title: 'Available',
                subtitle: 'Deliveries zilizopo',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.local_shipping,
                title: 'My Deliveries',
                subtitle: 'Deliveries zako',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.account_balance_wallet,
                title: 'Earnings',
                subtitle: 'Mapato yako',
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
