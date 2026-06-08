
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class StatusSelector extends StatefulWidget {
  @override
  _StatusSelectorState createState() => _StatusSelectorState();
}

class _StatusSelectorState extends State<StatusSelector> {
  String? selectedStatus;

  final Map<String, Color> options = {
    'مستأذن': Colors.blue.shade100,

    'متأخر': Colors.orange.shade100,

    'غائب': Colors.red.shade100,
    'حاضر': Colors.green.shade100,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: options.keys.map((status) {
        bool isSelected = selectedStatus == status;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.sp),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = status;
              });
            },
            child: Container(
              width: 90.sp,
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
              decoration: BoxDecoration(
                color: isSelected ? options[status] : kPrimaryColor,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? options[status]! : Colors.transparent,
                ),
              ),
              child: Text(status),
            ),
          ),
        );
      }).toList(),
    );
  }
}
