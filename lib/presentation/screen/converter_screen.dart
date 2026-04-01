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
                  Expanded(child: UnitDropdown()),
                  IconButton(onPressed: ()=> provider.swap(), icon: Icon(Icons.swap_horizontal_circle)),
                  Expanded(child: UnitDropdown()),
                 
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
