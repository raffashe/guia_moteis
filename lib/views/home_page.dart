import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../core/constants/app_colors.dart';
import 'widgets/elements/header_widget.dart';
import 'widgets/elements/location_widget.dart';
import 'widgets/home_content.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    logger.i('HomePage loaded');

    return Scaffold(
      backgroundColor: AppColors.redPrimary,
      body: Column(
        children: [
          HeaderWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: LocationWidget(location: 'minha localização'),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.bgModalMain,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const HomeContent(),
            ),
          ),
        ],
      ),
    );
  }
}
