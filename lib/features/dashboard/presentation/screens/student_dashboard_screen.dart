
import 'package:flutter/material.dart';

import '../widgets/dashboard_service_card.dart';
import '../widgets/winga_wallet_card.dart';

class StudentDashboardScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const StudentDashboardScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final fullName =
        user['fullName']?.toString() ?? 'Student';

    return Scaffold(
      appBar: AppBar(
        title: const Text('WINGA KIGANJANI'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
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
              'Karibu kwenye Winga Kiganjani.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // WINGA WALLET
            // ==================================================

            WingaWalletCard(
              balance: 0,
              dailyBudget: 0,
              dailyUsed: 0,
              onTap: () {},
            ),

            const SizedBox(height: 24),

            const Text(
              'Huduma Zako',
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
                  icon: Icons.restaurant,
                  title: 'Food',
                  subtitle: 'Nunua chakula',
                  onTap: () {},
                ),

                DashboardServiceCard(
                  icon: Icons.home_work,
                  title: 'Accommodation',
                  subtitle: 'Tafuta sehemu ya kuishi',
                  onTap: () {},
                ),

                DashboardServiceCard(
                  icon: Icons.store,
                  title: 'Marketplace',
                  subtitle: 'Nunua bidhaa',
                  onTap: () {},
                ),

                DashboardServiceCard(
                  icon: Icons.poll,
                  title: 'Research',
                  subtitle: 'Tafiti na questionnaires',
                  onTap: () {},
                ),

                DashboardServiceCard(
                  icon: Icons.credit_card,
                  title: 'Winga Card',
                  subtitle: 'Card yako ya Winga',
                  onTap: () {},
                ),

                DashboardServiceCard(
                  icon: Icons.receipt_long,
                  title: 'My Orders',
                  subtitle: 'Angalia orders',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
