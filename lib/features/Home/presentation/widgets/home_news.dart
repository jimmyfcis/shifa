import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/news/widgets/news_card.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../news/presentation/cubit/news_cubit.dart';
import '../../../news/presentation/cubit/news_state.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return BlocProvider(
      create: (context) => sl<NewsCubit>()..getNews(isLeksell: themeProvider.currentTheme==ThemeEnum.shifa?false:true),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is NewsFailure) {
            showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
          }
        },
        builder: (context, state) {
          return state is NewsLoading
              ? Center(
              child: CircularProgressIndicator(
                color: themeProvider.currentThemeData!.primaryColor,
              ))
              : state is NewsLoaded && state.newResponseModel.news!=null && state.newResponseModel.news!.isNotEmpty
              ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.news);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.tr.translate('news'),
                        style: TextStyles.nexaBold.copyWith(
                          fontSize: 16.sp,
                          color: AppTheme.textBlackColor,
                        ),
                      ),
                      Text(
                        context.tr.translate("see_all"),
                        style: TextStyles.nexaRegular.copyWith(
                          fontSize: 12.sp,
                          color: themeProvider.currentTheme == ThemeEnum.shifa
                              ? AppTheme.green5Color
                              : AppTheme.leksellPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 125.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 16.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.newResponseModel.news?.length ?? 0,
                  itemBuilder: (context, index) => NewsCard(newsItem: state.newResponseModel.news![index]),
                ),
              ),
            ],
          )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
