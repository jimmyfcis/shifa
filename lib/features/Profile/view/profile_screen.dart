import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifa/features/Profile/widgets/profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("FAFAFAF"),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const ProfileAppBar(),
        ],
      ),
    );
  }
}
