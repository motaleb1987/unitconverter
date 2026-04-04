import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitconverter/core/app_strings.dart';
import 'package:unitconverter/presentation/provider/converter_provider.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConverterProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(80),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(AppStrings.resultLabel, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text(provider.result, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: provider.fromUnit),
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward),
                      alignment: PlaceholderAlignment.middle,
                    ),
                    TextSpan(text: provider.toUnit),
                  ],
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
