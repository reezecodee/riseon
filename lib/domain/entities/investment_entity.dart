class InvestmentEntity {
  final String id;
  final String name;
  final String type;
  final double amount;
  final double currentValue;
  final double returnPercentage;
  final DateTime dateInvested;
  
  InvestmentEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.amount,
    required this.currentValue,
    required this.returnPercentage,
    required this.dateInvested,
  });
  
  double get totalReturn => currentValue - amount;
  bool get isProfit => returnPercentage >= 0;
}