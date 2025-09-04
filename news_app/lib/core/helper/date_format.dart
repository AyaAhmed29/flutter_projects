
import 'package:intl/intl.dart';

String dateformat(String date){
  return DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(date));
  
}