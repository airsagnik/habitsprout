import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:habitsprout/core/widgets/appbar.dart';
import 'package:habitsprout/rewards/model/reward_model.dart';
import 'package:habitsprout/rewards/widgets/coin_display.dart';
import 'package:provider/provider.dart';

class PokemonStorePage extends StatelessWidget {
  const PokemonStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonData =
        Provider.of<RewardManager>(context, listen: false).reward;
    return Scaffold(
      appBar: getAppBar('Rewards', null, CoinDisplay()),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: pokemonData.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonData[index];
          return PokemonCard(
            name: pokemon.rewardName,
            image: pokemon.imageUrl,
            price: pokemon.price.toInt(),
            rewardModel: pokemon,
          );
        },
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final RewardModel rewardModel;
  final bool isDisplay;

  const PokemonCard({
    super.key,
    required this.name,
    required this.rewardModel,
    required this.image,
    required this.price,
    this.isDisplay = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Pokémon Image
          Image.network(
            image,
            height: 100,
            fit: BoxFit.cover,
          ),
          // Pokémon Name
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Price Tag
          if(!isDisplay)
         ...[ Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Buy Button
          ElevatedButton(
            onPressed: () {
              final coins = Provider.of<RewardManager>(context,listen: false);
              String message = "";
              if (coins.habitoCoins >= price) {
                coins.collectRewards(rewardModel);
                message = "Successfully added to your collection!";
              }
              else
                {
                  message = "You need more coins to buy this pokemon";

                }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Buy',
              style: TextStyle(color: Colors.white),
            ),
          )],
        ],
      ),
    );
  }
}
