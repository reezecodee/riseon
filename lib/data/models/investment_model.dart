class InvestmentModel {
  final String id;
  final String name;
  final String type;
  final double amount;
  final double currentValue;
  final double returnPercentage;
  final DateTime dateInvested;
  
  InvestmentModel({
    required this.id,
    required this.name,
    required this.type,
    required this.amount,
    required this.currentValue,
    required this.returnPercentage,
    required this.dateInvested,
  });
  
  factory InvestmentModel.fromJson(Map<String, dynamic> json) {
    return InvestmentModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      currentValue: json['current_value'].toDouble(),
      returnPercentage: json['return_percentage'].toDouble(),
      dateInvested: DateTime.parse(json['date_invested']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'amount': amount,
      'current_value': currentValue,
      'return_percentage': returnPercentage,
      'date_invested': dateInvested.toIso8601String(),
    };
  }
}
