import 'package:flutter/material.dart';

AppBar getAppBar(String title, Function addAction, Widget? coinDisplay) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    leadingWidth: 25,
    //automaticallyImplyLeading: false, // Removes default back button
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          onPressed: () {
            addAction.call();
          }),
      if (coinDisplay != null) coinDisplay,
    ],
    elevation: 8.0, // Adds a shadow below the app bar
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(16),
      ),
    ),
  );
}
