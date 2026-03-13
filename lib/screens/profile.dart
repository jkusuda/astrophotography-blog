import 'package:flutter/material.dart';
import 'package:astrophotography_blog/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.prussianBlue,
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(color: AppColors.thistle, fontSize: 24),
        ),
      ),
    );
  }
}
