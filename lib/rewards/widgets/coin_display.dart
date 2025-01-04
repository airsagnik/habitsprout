import 'package:flutter/material.dart';
import 'package:habitsprout/core/task_manager/reward_manager.dart';
import 'package:provider/provider.dart';

class CoinDisplay extends StatelessWidget {
  const CoinDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RewardManager>(
      builder: (context,data,child) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.currency_bitcoin),
          Text(data.habitoCoins.toString()),
        ],
      ),
    );
  }
}
