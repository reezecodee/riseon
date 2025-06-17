import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/app_utils.dart';
import '../providers/investment_provider.dart';

class PortfolioSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InvestmentProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(AppConstants.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                'Total Portfolio',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                AppUtils.formatCurrency(provider.totalCurrentValue),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Modal',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        AppUtils.formatCurrency(provider.totalInvestment),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Keuntungan',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        AppUtils.formatCurrency(provider.totalReturn),
                        style: TextStyle(
                          color: provider.totalReturn >= 0 ? Colors.lightGreen : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
