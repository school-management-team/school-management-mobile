import 'dart:io' show File;

import 'package:dashed_border/dashed_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/constant.dart';

class addfiles extends StatefulWidget {
  const addfiles({Key? key}) : super(key: key);
  @override
  State<addfiles> createState() => fileadded();
}

class fileadded extends State<addfiles> {
  List<File> selectedfile = [];
  bool isLoading = false;

  Future<void> pickfile() async {
    setState(() {
      isLoading = true;
    });
    FilePickerResult? result = await FilePicker.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        selectedfile.addAll(result.files.map((file) => File(file.path!)));
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void removefile(int index) {
    setState(() {
      selectedfile.removeAt(index);
    });
  }

  static IconData getfileicon(String filepath) {
    final extension = filepath.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Icons.image;
      case 'rar':
      case 'zip':
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }

  static Color getfilecolor(String filepath) {
    final extension = filepath.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Colors.red.shade700;
      case 'doc':
      case 'docx':
        return Colors.blue.shade700;
      case 'png':
      case 'jpg':
      case 'jpeg':
        return Colors.purple.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      //  height: 172.19.h,
      padding: EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 23),
      margin: EdgeInsets.all(8.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Color(0xFFFFFFFF).withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: Color(0XFF071A2F).withOpacity(0.05),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 292.w,
            //height: 20.59.h,
            padding: EdgeInsets.only(bottom: 0.59),
            child: SizedBox(
              width: 35.16,
              height: 20.h,
              child: Text(
                'المرفقات',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF44474D),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          if (selectedfile.isNotEmpty) ...[
            Container(
              width: 292.w,
              child: Column(
                children: selectedfile.asMap().entries.map((entry) {
                  int index = entry.key;
                  File file = entry.value;
                  String filename = file.path.split('/').last;
                  final IconData fileicon = getfileicon(file.path);
                  final Color filecol = getfilecolor(file.path);
                  return Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(fileicon, color: filecol, size: 20.sp),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            filename,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Color(0xFF000000),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () => removefile(index),
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 16.sp,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 15.h),
          ],
          //...................................
          Center(
            child: Container(
              width: 292.w,
              // height: 94.59.h,
              padding: EdgeInsets.only(bottom: 16, top: 16),

              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),

                border: DashedBorder(
                  color: Colors.grey.shade400,
                  width: 2,
                  dashLength: 8,
                  dashGap: 4,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: MaterialButton(
                onPressed: isLoading ? null : pickfile,
                child: isLoading
                    ? SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.grey,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 15.62.w,
                            height: 25.h,
                            child: Icon(
                              Icons.attach_file,
                              color: Color(0xFF44474D),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            width: 123.2.w,
                            height: 26.59.h,
                            padding: EdgeInsets.only(bottom: 0.59),

                            child: SizedBox(
                              width: 123.2.w,
                              height: 26.h,
                              child: Text(
                                'إضافة ملف أو رابط',
                                style: TextStyle(
                                  color: Color(0xFF44474D),
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
