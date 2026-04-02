import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/converter_provider.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    return Row();
  }
}
