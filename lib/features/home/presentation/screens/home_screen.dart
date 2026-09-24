
import 'package:flutter/material.dart';
import '../../../food/presentation/screens/food_catalog_screen.dart';

import '../../../auth/presentation/screens/register_screen.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isLoggedIn;

  const HomeScreen({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // ============================================================
            // 1. APP HEADER
            // ============================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'WINGA KIGANJANI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Campus',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ============================================================
            // 2. GREETING
            // ============================================================
            const Text(
              'Habari Joshua 👋',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Karibu tena kwenye mtandao wako wa campus.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            // ============================================================
            // 3. SEARCH BAR
            // ============================================================
            TextField(
              decoration: InputDecoration(
                hintText: 'Tafuta chakula, hostel, bidhaa au huduma...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),

            const SizedBox(height: 20),

            // ============================================================
            // 4. DAILY BUDGET
            // ============================================================
            _buildBudgetCard(
              context,
              isLoggedIn,
            ),

            const SizedBox(height: 20),

            // ============================================================
            // 5. QUICK SERVICES
            // ============================================================
            const Text(
              'Huduma za Haraka',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // FOOD
                _QuickServiceItem(
                  icon: Icons.restaurant,
                  label: 'Food',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FoodCatalogScreen(),
                      ),
                    );
                  },
                ),

                // ACCOMMODATION
                _QuickServiceItem(
                  icon: Icons.hotel,
                  label: 'Accommodation',
                  onTap: () {
                    // Tutaiunganisha na Accommodation baadaye.
                  },
                ),

                // MARKETPLACE
                _QuickServiceItem(
                  icon: Icons.store,
                  label: 'Marketplace',
                  onTap: () {
                    // Tutaiunganisha na Marketplace baadaye.
                  },
                ),

                // RESEARCH
                _QuickServiceItem(
                  icon: Icons.poll,
                  label: 'Research',
                  onTap: () {
                    // Tutaiunganisha na Research baadaye.
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ============================================================
            // 6. NEARBY FOOD
            // ============================================================
            const Text(
              'Vyakula Vinavyopatikana Karibu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _HorizontalCard(
                    title: 'Pilau ya Kuku',
                    subtitle: 'Tsh 3,500',
                    location: 'Cafeteria A',
                  ),
                  _HorizontalCard(
                    title: 'Ugali Nyama',
                    subtitle: 'Tsh 2,500',
                    location: 'Mama Ntilie Hub',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ============================================================
            // 7. ACCOMMODATION
            // ============================================================
            const Text(
              'Hostels Karibu na Campus',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _HorizontalCard(
                    title: 'Mlimani Hostels',
                    subtitle: 'Tsh 600,000/ mwaka',
                    location: '500m kutoka Gate',
                  ),
                  _HorizontalCard(
                    title: "St. John's Modern Rooms",
                    subtitle: 'Tsh 80,000/ mwezi',
                    location: 'Majengo',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ============================================================
            // 8. RECOMMENDED
            // ============================================================
            const Text(
              'Zilizopendekezwa Kwako',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const SizedBox(height: 20),

            // ============================================================
            // 9. RESEARCH CORNER
            // ============================================================
            const Text(
              'Research Corner',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tengeneza au Jibu Tafiti za Wanafunzi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Shiriki kwenye tafiti za kitaaluma au anzisha yako sasa.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ================================================================
      // 10. BOTTOM NAVIGATION
      // ================================================================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Winga Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ================================================================
  // DAILY BUDGET CARD
  // ================================================================
  Widget _buildBudgetCard(
    BuildContext context,
    bool isUserLoggedIn,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isUserLoggedIn
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bajeti ya Leo',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Salio: Tsh 15,000',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Matumizi: Tsh 5,000',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  const Text(
                    'Fungua akaunti au ingia ili uone na kudhibiti bajeti yako ya kila siku.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
      child: const Text(
        'LOGIN',
      ),
    ),

    const SizedBox(width: 12),

    OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RegisterScreen(),
          ),
        );
      },
      child: const Text(
        'REGISTER',
      ),
    ),
  ],
),
                ],
              ),
      ),
    );
  }
}

// ======================================================================
// QUICK SERVICE ITEM
// ======================================================================

class _QuickServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _QuickServiceItem({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue[50],
              child: Icon(
                icon,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================================
// HORIZONTAL CARD
// ======================================================================

class _HorizontalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;

  const _HorizontalCard({
    required this.title,
    required this.subtitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

