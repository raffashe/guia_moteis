import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/presentation/modals/motel_details_modal.dart';
import '../widgets/location_widget.dart';
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
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icon_menu.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SegmentedControls(),
                  SvgPicture.asset(
                    'assets/search.svg',
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: LocationWidget(location: 'minha localização'),
          ),
          Expanded(
            child: MotelDetailsModal(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
