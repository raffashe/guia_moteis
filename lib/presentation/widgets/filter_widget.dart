import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guia_moteis/core/constants/app_colors.dart';
import 'package:guia_moteis/core/constants/app_text_styles.dart';
import '../../core/constants/app_filter.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final List<int> _selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: FilterConstants.filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndices.contains(index);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: index == 0
                        ? Colors.white
                        : (isSelected ? AppColors.redPrimary : Colors.white),
                    side: const BorderSide(color: AppColors.bgModalMain),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (index != 0) {
                        if (isSelected) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.add(index);
                        }
                      }
                    });
                  },
                  child: Row(
                    children: [
                      if (index == 0) ...[
                        SvgPicture.asset(
                          'assets/filter.svg',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        FilterConstants.filters[index],
                        style: AppTextStyles.os10SemiBold(
                          context,
                          color: index == 0
                              ? Colors.black
                              : (isSelected ? Colors.white : Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                if (index == 0 && _selectedIndices.isNotEmpty)
                  Positioned(
                    top: -4,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        _selectedIndices.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
