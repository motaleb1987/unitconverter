import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/converter_provider.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: List.generate(provider.categories.length, (index) {
        final category = provider.categories[index];
        final isSelected = provider.selectedCategoryIndex == index;
        return GestureDetector(
          onTap: () => context.read<ConverterProvider>().selectCategory(index),
          child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: isSelected ? Theme.of(context).primaryColor.withAlpha(80) : Theme.of(context).colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10),
          
              ),
              child: Column(children: [
            Icon(category.iconData),
            Text(category.name),
          ])),
        );

      }),
    );
  }
}
