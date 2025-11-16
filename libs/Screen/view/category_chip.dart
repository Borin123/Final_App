import 'package:flutter/material.dart';

class CategoryChip extends StatefulWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoryChip({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: List.generate(
          widget.categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(
                widget.categories[index],
                style: TextStyle(
                  color: widget.selectedIndex == index
                      ? Colors.white
                      : isDark
                          ? Colors.grey[300]!
                          : Colors.grey[600]!,
                  fontWeight: widget.selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              selected: widget.selectedIndex == index,
              selectedColor: Theme.of(context).primaryColor,
              backgroundColor: isDark ? Colors.white10 : Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onSelected: (bool selected) {
                widget.onCategorySelected(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
