import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String get toCurrency {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }
  
  String get toPercentage {
    return '${toStringAsFixed(2)}%';
  }
  
  String get toCompactCurrency {
    if (this >= 1000000000) {
      return 'Rp ${(this / 1000000000).toStringAsFixed(1)}M';
    } else if (this >= 1000000) {
      return 'Rp ${(this / 1000000).toStringAsFixed(1)}Jt';
    } else if (this >= 1000) {
      return 'Rp ${(this / 1000).toStringAsFixed(1)}K';
    } else {
      return toCurrency;
    }
  }
}