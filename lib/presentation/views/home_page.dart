import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import '../widgets/segmented_controls_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redPrimary,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icon_menu.svg',
                    width: 24,
                    height: 24,
                  ),
                  SegmentedControls(),
                  SvgPicture.asset(
                    'assets/search.svg',
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
