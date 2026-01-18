import 'package:flutter/material.dart';
import '../../core/colors.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    // 🔐 Simulated bank-linked data (future: real bank API)
    final int totalIncome = 15000;
    final int totalExpense = 9200;
    final int balance = totalIncome - totalExpense;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Financial Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _summaryCard(
              title: "Current Balance",
              amount: "₹$balance",
              color: AppColors.success,
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    title: "Total Income",
                    amount: "₹$totalIncome",
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _summaryCard(
                    title: "Total Expense",
                    amount: "₹$totalExpense",
                    color: AppColors.danger,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Where your money is spent",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Groceries"),
              trailing: Text("₹3,000"),
            ),
            const ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text("Transport"),
              trailing: Text("₹1,500"),
            ),
            const ListTile(
              leading: Icon(Icons.agriculture),
              title: Text("Farming Supplies"),
              trailing: Text("₹2,700"),
            ),
            const ListTile(
              leading: Icon(Icons.flash_on),
              title: Text("Electricity & Utilities"),
              trailing: Text("₹2,000"),
            ),

            const SizedBox(height: 12),
            const Text(
              "ℹ Data is auto-synced from bank account",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard({
    required String title,
    required String amount,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 6),
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
