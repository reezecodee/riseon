import 'package:flutter/material.dart';
import '../../core/utils/app_utils.dart';
import '../../data/models/investment_model.dart';

class InvestmentCard extends StatelessWidget {
  final InvestmentModel investment;
  
  const InvestmentCard({Key? key, required this.investment}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final isProfit = investment.returnPercentage >= 0;
    
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  investment.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  investment.type,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Modal Awal', style: TextStyle(color: Colors.grey[600])),
                    Text(
                      AppUtils.formatCurrency(investment.amount),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Nilai Sekarang', style: TextStyle(color: Colors.grey[600])),
                    Text(
                      AppUtils.formatCurrency(investment.currentValue),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Return: ${investment.returnPercentage.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: isProfit ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppUtils.formatDate(investment.dateInvested),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}