import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifa/core/widgtes/appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          CommonAppBar(
            backGroundColor: HexColor("4270b7"),
            hasBorderRadius: true,
            height: 148,
          ),
        ],
      ),
    );
  }
}
