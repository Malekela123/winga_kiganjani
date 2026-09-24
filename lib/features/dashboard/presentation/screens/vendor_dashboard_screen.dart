
import 'package:flutter/material.dart';

import '../widgets/dashboard_service_card.dart';
import '../widgets/winga_wallet_card.dart';

class VendorDashboardScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const VendorDashboardScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final fullName =
        user['fullName']?.toString() ?? 'Vendor';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
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
            'Simamia biashara yako kupitia Winga Kiganjani.',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          WingaWalletCard(
            onTap: () {},
          ),

          const SizedBox(height: 24),

          const Text(
            'Business Management',
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
                icon: Icons.restaurant_menu,
                title: 'My Foods',
                subtitle: 'Simamia vyakula',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.add_business,
                title: 'Add Food',
                subtitle: 'Ongeza chakula',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.shopping_bag,
                title: 'Orders',
                subtitle: 'Orders za wateja',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.bar_chart,
                title: 'Sales',
                subtitle: 'Angalia mauzo',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.account_balance_wallet,
                title: 'Winga Wallet',
                subtitle: 'Wallet & earnings',
                onTap: () {},
              ),
              DashboardServiceCard(
                icon: Icons.person,
                title: 'Profile',
                subtitle: 'Wasifu wa biashara',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
