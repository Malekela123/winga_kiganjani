
import 'package:flutter/material.dart';

class WingaWalletCard extends StatelessWidget {
  final double balance;
  final double dailyBudget;
  final double dailyUsed;
  final VoidCallback? onTap;

  const WingaWalletCard({
    super.key,
    this.balance = 0,
    this.dailyBudget = 0,
    this.dailyUsed = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double remainingBudget =
        dailyBudget > dailyUsed
            ? dailyBudget - dailyUsed
            : 0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Winga Wallet',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Text(
                'Wallet Balance',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'TZS ${balance.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: _BudgetInfo(
                      title: 'Daily Budget',
                      value:
                          'TZS ${dailyBudget.toStringAsFixed(0)}',
                      icon: Icons.flag_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _BudgetInfo(
                      title: 'Remaining',
                      value:
                          'TZS ${remainingBudget.toStringAsFixed(0)}',
                      icon: Icons.account_balance,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              if (dailyBudget == 0)
                const Text(
                  'Daily budget haijawekwa bado.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BudgetInfo extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _BudgetInfo({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
