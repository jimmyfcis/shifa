import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shifa/core/assets/svg/svg_assets.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/core/widgtes/custom_green_button.dart';
import 'package:shifa/core/widgtes/form_fields/custom_text_field.dart';
import 'package:shifa/core/widgtes/form_fields/phone_number_field.dart';

import '../../../core/widgtes/form_fields/email_text_field.dart';
import 'contact_us_item.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Contact Us",
                style: TextStyles.nexaBold.copyWith(
                  fontSize: 18.sp,
                  color: AppTheme.blackColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const ContactUsItem(
                icon: SVGAssets.location,
                title: "Cairo, Egypt",
                subtitle: "The 5th Settlement",
              ),
              SizedBox(
                height: 16.h,
              ),
              const ContactUsItem(
                icon: SVGAssets.call,
                title: "15051",
                subtitle: "Available 24/7",
              ),
              SizedBox(
                height: 16.h,
              ),
              const ContactUsItem(
                icon: SVGAssets.email,
                title: "info@shifaegypt.com",
                subtitle: "send us your query anytime!",
              ),
              SizedBox(height: 16.h),
              const Divider(color: AppTheme.greyColor),
              SizedBox(height: 24.h),
              Text(
                "Get in touch",
                style: TextStyles.nexaBold.copyWith(
                  fontSize: 18.sp,
                  color: AppTheme.blackColor,
                ),
              ),
              SizedBox(height: 16.h),
              const CustomTextField(name: "name", labelText: "Name",hintText: "Enter your name",),
              SizedBox(height: 16.h),
              const EmailTextField(name: "email", labelText: "Email"),
              SizedBox(height: 16.h),
              PhoneNumberField(controller: phoneController),
              SizedBox(height: 16.h),
              const CustomTextField(name: "subject", labelText: "Subject",hintText: "message subject",),
              SizedBox(height: 16.h),
              const CustomTextField(name: "message", labelText: "Message",hintText: "Enter your message",maxLines: 7,),
              SizedBox(height: 16.h),
              CustomGreenButton(title: "Send Message",onPressed: (){},),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
