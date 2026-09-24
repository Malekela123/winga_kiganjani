
import 'package:flutter/material.dart';

class WingaWalletScreen extends StatelessWidget {
  const WingaWalletScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Winga Wallet'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    size: 35,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Wallet Balance',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'TZS 0',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.flag_outlined,
              ),
              title: const Text(
                'Daily Budget',
              ),
              subtitle: const Text(
                'Haijawekwa bado',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {
                // Fixed budget itaongezwa hapa baadaye.
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.history,
              ),
              title: const Text(
                'Wallet Transactions',
              ),
              subtitle: const Text(
                'Historia ya matumizi',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text(
                'Wallet Settings',
              ),
              subtitle: const Text(
                'Mipangilio ya wallet',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
