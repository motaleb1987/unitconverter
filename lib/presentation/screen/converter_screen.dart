import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitconverter/core/app_strings.dart';

import '../provider/converter_provider.dart';
import '../widget/category_selector.dart';
import '../widget/input_field.dart';
import '../widget/unit_dropdown.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.chooseCategory,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              CategorySelector(),
              Text(
                AppStrings.enterValue,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
               InputField(),
              Text(
                AppStrings.selectUnits,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Expanded(
                    child: UnitDropdown(
                      label: AppStrings.fromLabel,
                      selectedUnit: provider.fromUnit,
                      units: provider.currentUnit,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateFormUnit(
                          value!,
                        );
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.read<ConverterProvider>().swap(),
                    icon: Icon(Icons.swap_horiz),
                  ),
                  Expanded(
                    child: UnitDropdown(
                      label: AppStrings.toLabel,
                      selectedUnit: provider.toUnit,
                      units: provider.currentUnit,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateToUnit(value!);
                      },
                    ),
                  ),
                ],
              ),
              //ResultCard(),
            ],
          ),
        ),
      ),
    );
  }
}
