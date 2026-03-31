import 'package:flutter/material.dart';
import 'package:unitconverter/domain/entities/unit_category.dart';

class UnitCategoryModel extends UnitCategory {
  const UnitCategoryModel({
    required super.name,
    required super.iconData,
    required super.units,
  });

  static const List<UnitCategoryModel> allCategories = [
    UnitCategoryModel(
      name: 'Length',
      iconData: Icons.straighten,
      units: ['Meter', 'Kilometer', 'Mile', 'Foot', 'Inch', 'Centimeter'],
    ),
    UnitCategoryModel(
      name: 'Weight',
      iconData: Icons.fitness_center,
      units: ['Kilogram', 'Gram', 'Pound', 'Ounce'],
    ),
    UnitCategoryModel(
      name: 'Temperature',
      iconData: Icons.thermostat,
      units: ['Celsius', 'Fahrenheit', 'Kelvin'],
    ),
  ];

  static double convert({
    required String categoryName,
    required double value,
    required String fromUnit,
    required double toUnit,
}){
    if(fromUnit == toUnit) return value;
    switch(categoryName){
      case 'length':
      case 'Weight':
      case 'Temperature':
      default:

    }
}

static double _convertLength(double value, String from, String to){
    final double inMeters;
}

double _fromUnit(double value, String unit){
    switch(unit){
      case 'Meter':
        return value;
    }
}



}
