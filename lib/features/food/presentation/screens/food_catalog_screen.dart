import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/food_provider.dart';

class FoodCatalogScreen extends StatefulWidget {
  const FoodCatalogScreen({super.key});

  @override
  State<FoodCatalogScreen> createState() => _FoodCatalogScreenState();
}

class _FoodCatalogScreenState extends State<FoodCatalogScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FoodProvider>().loadFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: Consumer<FoodProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      provider.error!,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: provider.refresh,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (provider.foods.isEmpty) {
            return const Center(
              child: Text(
                'Hakuna chakula kinachopatikana kwa sasa.',
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.foods.length,
              itemBuilder: (context, index) {
                final food = provider.foods[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: _FoodImage(
                      imageUrl: food.imageUrl,
                    ),

                    title: Text(
                      food.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),

                        Text(
                          _formatPrice(
                            food.minPrice,
                            food.maxPrice,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          food.available
                              ? 'Inapatikana'
                              : 'Haipatikani',
                          style: TextStyle(
                            fontSize: 12,
                            color: food.available
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    trailing: food.available
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _formatPrice(
    dynamic minPrice,
    dynamic maxPrice,
  ) {
    final min = double.tryParse(minPrice.toString()) ?? 0;
    final max = double.tryParse(maxPrice.toString()) ?? 0;

    if (min == max) {
      return 'TZS ${min.toStringAsFixed(0)}';
    }

    return 'TZS ${min.toStringAsFixed(0)} - '
        '${max.toStringAsFixed(0)}';
  }
}

class _FoodImage extends StatelessWidget {
  final String? imageUrl;

  const _FoodImage({
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const CircleAvatar(
        child: Icon(Icons.restaurant),
      );
    }

    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl!),
    );
  }
}