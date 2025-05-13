import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/storage/token_storage.dart';
import '../../../core/theme/theme.dart';
import 'package:provider/provider.dart';
class UserNameAndPhoneNumber extends StatefulWidget {
  const UserNameAndPhoneNumber({super.key});

  @override
  State<UserNameAndPhoneNumber> createState() => _UserNameAndPhoneNumberState();
}

class _UserNameAndPhoneNumberState extends State<UserNameAndPhoneNumber> {

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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: 327.w,
      decoration: BoxDecoration(
        color: themeProvider.currentTheme==ThemeEnum.shifa?AppTheme.billColor:AppTheme.secondaryColorLeksell,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _userName,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "+20 $_phoneNumber",
            style: TextStyle(
              color: themeProvider.currentThemeData!.primaryColor,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
