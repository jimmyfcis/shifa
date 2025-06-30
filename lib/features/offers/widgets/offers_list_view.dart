import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/widgtes/empty_state.dart';
import '../presentation/cubit/offers_cubit.dart';
import 'offers_card.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/custom_snackbar.dart';
import '../presentation/cubit/offers_state.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => sl<OffersCubit>()..getOffers(),
      child: BlocConsumer<OffersCubit, OffersState>(
        listener: (context, state) {
          if (state is OffersFailure) {
            showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
          }
        },
        builder: (context, state) {
          return state is OffersLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: themeProvider.currentThemeData!.primaryColor,
                ))
              : state is OffersLoaded
                  ? state.offersResponseModel.offers == null || state.offersResponseModel.offers!.isEmpty
                      ? EmptyStateWidget(message: context.tr.translate("no_offers"))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: state.offersResponseModel.offers?.length ?? 0,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.offersDetails,
                                    arguments: {"offer":state.offersResponseModel.offers![index]});
                              },
                              child: OffersCard(
                                offerItem: state.offersResponseModel.offers![index],
                              ),
                            ),
                          ),
                        )
                  : const SizedBox.shrink();
        },
      ),
    );
  }
} 