//enum for expense categories
import 'package:flutter/material.dart';

enum ExpenseCategory { food, transport, health, shopping, subscription }

//category images
final Map<ExpenseCategory, String> expenseCategoryImages = {
  ExpenseCategory.food: 'assets/images/restaurant.png',
  ExpenseCategory.transport: 'assets/images/car.png',
  ExpenseCategory.health: 'assets/images/health.png',
  ExpenseCategory.shopping: 'assets/images/bag.png',
  ExpenseCategory.subscription: 'assets/images/bill.png',
};

//category colors
final Map<ExpenseCategory, Color> expenseCategoryColors = {
  ExpenseCategory.food: const Color(0xFFFF7043),
  ExpenseCategory.transport: const Color(0xFF42A5F5),
  ExpenseCategory.health: const Color(0xFF66BB6A),
  ExpenseCategory.shopping: const Color(0xFFFFCA28),
  ExpenseCategory.subscription: const Color(0xFFAB47BC),
};

//model
class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
