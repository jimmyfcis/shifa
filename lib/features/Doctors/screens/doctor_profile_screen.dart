import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/features/Doctors/presentation/doctor_cubit.dart';
import '../../../core/assets/svg/svg_assets.dart';
import '../../../core/models/doctor_model.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/theme/styles.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/common_app_bar_title.dart';
import '../../../core/widgtes/custom_green_button.dart';
import '../../../core/widgtes/watermark_widget.dart';
import '../presentation/doctor_state.dart';
import '../widgets/doctor_profile_title.dart';
import '../widgets/time_slot.dart';

class DoctorProfileScreen extends StatefulWidget {
  final bool? fromBookings;
  final String clinicId;
  final String doctorId;

  const DoctorProfileScreen({super.key, this.fromBookings = false, required this.clinicId, required this.doctorId});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  int? _selectedTimeSlotIndex;
  DateTime _selectedDate = DateTime.now();

  List<DateTime> _generateDates(DateTime selectedDate) {
    return List.generate(7, (index) => selectedDate.subtract(Duration(days: 3 - index)));
  }

  String concatenateSlotTime(ScheduleSlot? slot) {
    bool isPM = true;
    if (slot?.timeStart?.contains("am") ?? false) {
      setState(() {
        isPM = false;
      });
    }
    String time = "${slot?.timeStart ?? ""} -> ${slot?.timeEnd ?? ""}".replaceAll("pm", "");
    return isPM ? "$time PM" : "$time AM";
  }

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
      appBarChild: CommonAppBarTitle(
        title: context.tr.translate('doctor_profile'),
      ),
      contentChild: Expanded(
        child: BlocProvider(
          create: (context) {
            final cubit = sl<DoctorCubit>();
            cubit.getDoctorDetails(
                clinicId: widget.clinicId, id: widget.doctorId); // Call the method immediately after creating the cubit
            return cubit;
          },
          child: BlocConsumer<DoctorCubit, DoctorState>(
            listener: (context, state) {},
            builder: (context, state) {
              final locale = Localizations.localeOf(context);
              final isArabic = locale.languageCode == 'ar';
              return state is DoctorLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: themeProvider.currentThemeData!.primaryColor,
                      ),
                    )
                  : state is DoctorLoaded
                      ? Column(
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
                                                isArabic
                                                    ? state.doctorDetailsResponse.doctor.nameAR ?? ""
                                                    : state.doctorDetailsResponse.doctor.name ?? "",
                                                style: TextStyles.nexaBold.copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  color: AppTheme.primaryTextColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                isArabic
                                                    ? state.doctorDetailsResponse.doctor.specialist?.nameAr ?? ""
                                                    : state.doctorDetailsResponse.doctor.specialist?.name ?? "",
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
                                                    state.doctorDetailsResponse.doctor.rate ?? "",
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
                                      DoctorProfileTitle(title: context.tr.translate("doctor_biography")),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        isArabic
                                            ? state.doctorDetailsResponse.doctor.descriptionAr ?? ""
                                            : state.doctorDetailsResponse.doctor.description ?? "",
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
                                          DoctorProfileTitle(title: context.tr.translate("schedules")),
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
                                                    padding:
                                                        const EdgeInsets.symmetric(vertical: 8.5, horizontal: 11.5),
                                                    child: Text(
                                                      DateFormat("MMM, yyyy").format(_selectedDate),
                                                      style: TextStyles.nexaRegular.copyWith(
                                                        color: AppTheme.primaryTextColor,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: themeProvider.currentThemeData!.primaryColor,
                                                    borderRadius: const BorderRadius.only(
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
                                          final isDisabled = day.isBefore(
                                              DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
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
                                                color: isSelected
                                                    ? themeProvider.currentThemeData!.primaryColor
                                                    : AppTheme.whiteColor,
                                                border: Border.all(
                                                  color: isSelected
                                                      ? themeProvider.currentThemeData!.primaryColor
                                                      : AppTheme.greyColor,
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
                                                      DateFormat("EEE").format(day),
                                                      // "Mon", "Tue"
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
                                                      DateFormat("d").format(day),
                                                      // Day of the month
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
                                      DoctorProfileTitle(title: context.tr.translate("pick_slot")),
                                      const SizedBox(height: 16.0),
                                      Wrap(
                                        spacing: 20,
                                        runSpacing: 20,
                                        alignment: WrapAlignment.spaceEvenly,
                                        children: List.generate(
                                          state.doctorDetailsResponse.doctor.schedules
                                                  ?.firstWhere(
                                                    (element) =>
                                                        element.shiftDate!.year == _selectedDate.year &&
                                                        element.shiftDate!.month == _selectedDate.month &&
                                                        element.shiftDate!.day == _selectedDate.day,
                                                    orElse: () => Schedule(shiftDate: _selectedDate, slots: []),
                                                  )
                                                  .slots
                                                  ?.length ??
                                              0,
                                          (index) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _selectedTimeSlotIndex = index;
                                              });
                                            },
                                            child: TimeSlot(
                                              time: concatenateSlotTime(state.doctorDetailsResponse.doctor.schedules
                                                  ?.firstWhere(
                                                    (element) =>
                                                        element.shiftDate!.year == _selectedDate.year &&
                                                        element.shiftDate!.month == _selectedDate.month &&
                                                        element.shiftDate!.day == _selectedDate.day,
                                                    orElse: () => Schedule(shiftDate: _selectedDate, slots: []),
                                                  )
                                                  .slots![index]),
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
                                  title: widget.fromBookings != null && widget.fromBookings == true
                                      ? context.tr.translate('save_changes')
                                      : context.tr.translate('book_appointment'),
                                  onPressed: () {
                                    if (_selectedTimeSlotIndex != null) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            "${context.tr.translate('booked_success')}: ${DateFormat("EE,MMM, yyyy").format(_selectedDate)} ${concatenateSlotTime(state.doctorDetailsResponse.doctor.schedules!.firstWhere(
                                                  (element) =>
                                                      element.shiftDate!.year == _selectedDate.year &&
                                                      element.shiftDate!.month == _selectedDate.month &&
                                                      element.shiftDate!.day == _selectedDate.day,
                                                ).slots![_selectedTimeSlotIndex!])}"),
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
                                                  minWidth: 100,
                                                  minHeight: 50,
                                                ),
                                                padding: const EdgeInsets.all(32),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.all(
                                                          Radius.circular(50.0),
                                                        ),
                                                        color: themeProvider.currentTheme == ThemeEnum.shifa
                                                            ? AppTheme.green4Color
                                                            : AppTheme.secondaryColorLeksell,
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
                                                      context.tr.translate('reschedule_appointment'),
                                                      style: TextStyles.nexaBold.copyWith(
                                                        color: AppTheme.primaryTextColor,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      context.tr.translate('reschedule_success'),
                                                      style: TextStyles.nexaRegular.copyWith(
                                                        color: AppTheme.secondaryTextColor,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 24),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pushReplacementNamed(context, AppRoutes.bottomBar);
                                                      },
                                                      child: Text(
                                                        context.tr.translate('my_appointments'),
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
                                        Navigator.pushNamed(context, AppRoutes.firstBookAppointment, arguments: {
                                          "clinicID": widget.clinicId,
                                          "doctor": state.doctorDetailsResponse.doctor,
                                          "date": DateFormat('yyyy-MM-dd').format(_selectedDate),
                                          "doctorId": widget.doctorId,
                                          "time": state.doctorDetailsResponse.doctor.schedules!
                                                  .firstWhere(
                                                    (element) =>
                                                        element.shiftDate!.year == _selectedDate.year &&
                                                        element.shiftDate!.month == _selectedDate.month &&
                                                        element.shiftDate!.day == _selectedDate.day,
                                                  )
                                                  .slots![_selectedTimeSlotIndex!]
                                                  .timeStart
                                                  ?.replaceAll(" pm", "")
                                                  .replaceAll(" am", "") ??
                                              "",
                                        });
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(context.tr.translate('please_select_time_slot')),
                                      ));
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
