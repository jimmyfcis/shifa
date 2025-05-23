import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import '../../../core/storage/token_storage.dart';
import '../../My Profile/widgets/my_profile_widget.dart';

class MySelfBookingDetails extends StatefulWidget {
  const MySelfBookingDetails({super.key});

  @override
  State<MySelfBookingDetails> createState() => _MySelfBookingDetailsState();
}

class _MySelfBookingDetailsState extends State<MySelfBookingDetails> {

  String _userName = '';
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }
  Future<void> _loadUserName() async {
    final storage = TokenStorage();
    final user = await storage.getUser();
    if (mounted && user != null) {
      setState(() {
        _userName = user.name??"";
        _phoneNumber = user.phoneNumber??"";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MyProfileWidget(
            title: context.tr.translate("name"), subTitle: _userName, hasDivider: true),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 16.h,
        ),
         MyProfileWidget(
            title: context.tr.translate("phone_number"),
            subTitle: isArabic?"$_phoneNumber 20+":"+20 $_phoneNumber",
            hasDivider: true),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
