import 'package:flutter/material.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/watermark_widget.dart';
import '../widgets/doctor_profile_title.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DoctorProfileScreen extends StatefulWidget {
  final bool? fromBookings;

  const DoctorProfileScreen({super.key, this.fromBookings = false});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  int? _selectedTimeSlotIndex;
  DateTime _selectedDate = DateTime.now();

  // Generate a list of dates around the selected date
  List<DateTime> _generateDates(DateTime selectedDate) {
    return List.generate(7, (index) => selectedDate.subtract(Duration(days: 3 - index)));
  }

  final List<String> _timeSlots = [
    "09:00 - 11:30 AM",
    "07:30 - 10:30 PM",
    "05:30 - 06:30 PM",
    "07:30 - 10:30 PM",
    "10:30 - 11:30 PM",
    "11:30 - 12:30 PM",
  ];

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100), // Latest date
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final List<DateTime> days = _generateDates(_selectedDate);
    return WaterMark(
      backGroundColor: themeProvider.currentThemeData!.primaryColor,
      hasBorderRadius: false,
      alignment: Alignment.bottomCenter,
      height: 105,
      appBarChild: const CommonAppBarTitle(
        title: 'Doctor Profile',
      ),
      contentChild:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/svg/icons/docpng.png"),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              "Dr.Fady Mohamed Nabil",
                              style: TextStyles.nexaBold.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppTheme.primaryTextColor,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                             Text(
                              "Obstetrics and Gynecology Dep",
                              style: TextStyles.nexaRegular.copyWith(
                                color: AppTheme.secondaryTextColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset(SVGAssets.star),
                                const SizedBox(width: 4),
                                Text(
                                  "4,7",
                                  style: TextStyles.nexaRegular.copyWith(
                                    color: AppTheme.secondaryTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset(SVGAssets.money),
                                const SizedBox(width: 4),
                                 Text(
                                  "750 EGP",
                                  style: TextStyles.nexaRegular.copyWith(
                                    color: AppTheme.grey7Color,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    const Divider(
                      indent: 0,
                      height: 0,
                      endIndent: 0,
                      color: AppTheme.greyColor,
                      thickness: 1.0,
                    ),
                    const SizedBox(height: 24.0),
                    const DoctorProfileTitle(title: "Doctor Biography"),
                    const SizedBox(height: 8.0),
                     Text(
                      "Specialist and A. Lecturer of Gynecology and Obstetrics - Faculty of Medicine - Ain Shams University.",
                      style: TextStyles.nexaRegular.copyWith(
                        color: AppTheme.secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Divider(
                      indent: 0,
                      height: 0,
                      endIndent: 0,
                      color: AppTheme.greyColor,
                      thickness: 1.0,
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DoctorProfileTitle(title: "Schedules"),
                        InkWell(
                          onTap: () => _pickDate(context),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppTheme.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    bottomLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.5, horizontal: 11.5),
                                  child: Text(
                                    DateFormat("MMM, yyyy").format(_selectedDate),
                                    style:  TextStyles.nexaRegular.copyWith(
                                      color: AppTheme.primaryTextColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:  BoxDecoration(
                                  color: themeProvider.currentThemeData!.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(SVGAssets.calendarWhite),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 10,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: days.map((day) {
                        final isSelected = day.isAtSameMomentAs(_selectedDate);
                        final isDisabled =
                        day.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
                        return GestureDetector(
                          onTap: isDisabled
                              ? null
                              : () {
                            setState(() {
                              _selectedDate = day;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected ? themeProvider.currentThemeData!.primaryColor : AppTheme.whiteColor,
                              border: Border.all(
                                color: isSelected ? themeProvider.currentThemeData!.primaryColor : AppTheme.greyColor,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 14.0,
                                horizontal: 11.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat("EEE").format(day), // "Mon", "Tue"
                                    style: TextStyles.nexaRegular.copyWith(
                                      color: isDisabled
                                          ? AppTheme.hintColor
                                          : isSelected
                                          ? AppTheme.whiteColor
                                          : AppTheme.secondaryTextColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("d").format(day), // Day of the month
                                    style: TextStyles.nexaBold.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isDisabled
                                          ? AppTheme.hintColor
                                          : isSelected
                                          ? AppTheme.whiteColor
                                          : AppTheme.primaryTextColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24.0),
                    const Divider(
                      indent: 0,
                      height: 0,
                      endIndent: 0,
                      color: AppTheme.greyColor,
                      thickness: 1.0,
                    ),
                    const SizedBox(height: 24.0),
                    const DoctorProfileTitle(title: "Pick time slot"),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      children: List.generate(
                        _timeSlots.length,
                            (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTimeSlotIndex = index;
                            });
                          },
                          child: TimeSlot(
                            time: _timeSlots[index],
                            isSelected: _selectedTimeSlotIndex == index,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            color: AppTheme.whiteColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 24, right: 24, bottom: 20),
              child: CustomGreenButton(
                title: widget.fromBookings!=null&&widget.fromBookings==true?"Save Changes":"Book appointment",
                onPressed: () {
                  if (_selectedTimeSlotIndex != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Booked: ${DateFormat("EE,MMM, yyyy").format(_selectedDate)} ${_timeSlots[_selectedTimeSlotIndex!]}"),
                    ));
                    if (widget.fromBookings ?? false) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 100, // Minimum width
                                minHeight: 50, // Minimum height
                              ),
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min, // Ensures dialog size adjusts to content
                                children: [
                                  Container(
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                      color: themeProvider.currentTheme==ThemeEnum.shifa?AppTheme.green4Color:AppTheme.secondaryColorLeksell,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: SvgPicture.asset(
                                        SVGAssets.success,
                                        color: themeProvider.currentThemeData!.primaryColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                   Text(
                                    "Reschedule appointment",
                                    style: TextStyles.nexaBold.copyWith(
                                      color: AppTheme.primaryTextColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                   Text(
                                    "Your Reschedule has been updated successful.",
                                    style: TextStyles.nexaRegular.copyWith(
                                      color: AppTheme.secondaryTextColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                                    },
                                    child:  Text(
                                      "My Appointments",
                                      style: TextStyles.nexaRegular.copyWith(
                                        decoration: TextDecoration.underline,
                                        color: themeProvider.currentThemeData!.primaryColor,
                                        decorationColor: themeProvider.currentThemeData!.primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                     // Navigator.pushNamed(context, AppRoutes.firstBookAppointment);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please select a time slot."),
                    ));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeSlot extends StatelessWidget {
  final String time;
  final bool isSelected;

  const TimeSlot({
    super.key,
    required this.time,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: 156,
      height: 38,
      decoration: BoxDecoration(
        color: isSelected ? themeProvider.currentThemeData!.primaryColor : AppTheme.whiteColor,
        border: Border.all(color: AppTheme.greyColor),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyles.nexaRegular.copyWith(
            color: isSelected ? AppTheme.whiteColor : AppTheme.primaryTextColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}