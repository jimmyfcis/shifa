import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../My Profile/widgets/my_profile_widget.dart';

class MySelfBookingDetails extends StatefulWidget {
  const MySelfBookingDetails({super.key});

  @override
  State<MySelfBookingDetails> createState() => _MySelfBookingDetailsState();
}

class _MySelfBookingDetailsState extends State<MySelfBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyProfileWidget(
            title: "Name", subTitle: "Ahmed Salah", hasDivider: true),
        SizedBox(
          height: 16.h,
        ),
        const MyProfileWidget(
            title: "Date Of Birth",
            subTitle: "05/04/1999",
            hasDivider: true),
        SizedBox(
          height: 16.h,
        ),
        const MyProfileWidget(
            title: "Gender", subTitle: "Male", hasDivider: true),
        SizedBox(
          height: 16.h,
        ),
        const MyProfileWidget(
            title: "Phone Number",
            subTitle: "+201098037023",
            hasDivider: true),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
