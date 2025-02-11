import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guia_moteis/presentation/widgets/elements/segmented_controls_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
