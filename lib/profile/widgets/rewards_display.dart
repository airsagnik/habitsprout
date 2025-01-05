import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/task_manager/reward_manager.dart';
import '../../core/widgets/appbar.dart';
import '../../rewards/screen/reward_screen.dart';
import '../../rewards/widgets/coin_display.dart';

class RewardsDisplay extends StatelessWidget {
  const RewardsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RewardManager>(
        builder: (context, data, child) => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: data.collectedReward.length,
          itemBuilder: (context, index) {
            final pokemon = data.collectedReward[index];
            return PokemonCard(
              name: pokemon.rewardName,
              image: pokemon.imageUrl,
              price: pokemon.price.toInt(),
              rewardModel: pokemon,
              isDisplay: true,
            );
          },
        ),
      );

  }
}
