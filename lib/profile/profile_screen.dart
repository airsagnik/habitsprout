import 'package:flutter/material.dart';
import 'package:habitsprout/core/widgets/appbar.dart';
import 'package:habitsprout/profile/widgets/rewards_display.dart';
import 'package:habitsprout/rewards/widgets/coin_display.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Profile', () {}, CoinDisplay()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'), // Replace with your photo URL
                    ),
                    SizedBox(height: 16),
                    // Email
                    Text(
                      'john.doe@example.com', // Replace with user's email
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Name
                    Text(
                      'John Doe', // Replace with user's name
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 5,
            ),
            Expanded(child: RewardsDisplay())

            // Rewards Section
          ],
        ),
      ),
    );
  }
}
