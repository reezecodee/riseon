import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toFormattedString {
    return DateFormat('dd MMM yyyy', 'id_ID').format(this);
  }
  
  String get toTimeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    
    if (difference.inDays > 7) {
      return toFormattedString;
    } else if (difference.inDays > 0) {
      return '${difference.inDays} hari lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit lalu';
    } else {
      return 'Baru saja';
    }
  }
  
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}