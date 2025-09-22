import 'package:flutter/material.dart';
//income categories
enum IncomeCategory { freelance, salary, passive, sales }

//category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: 'assets/images/freelance.png',
  IncomeCategory.salary: 'assets/images/health.png',
  IncomeCategory.passive: 'assets/images/car.png',
  IncomeCategory.sales: 'assets/images/salary.png',
};

//category colors
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.freelance: const Color(0xFFE57373),
  IncomeCategory.salary: const Color(0xFF64B5F6),
  IncomeCategory.passive: const Color(0xFF4CAF50),
  IncomeCategory.sales: const Color(0xFFFFC107),
};

class Income {
  final int id;
  final String tittle;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.tittle,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
