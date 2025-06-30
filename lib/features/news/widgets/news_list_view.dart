import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/core/widgtes/empty_state.dart';
import 'package:shifa/features/news/presentation/cubit/news_cubit.dart';
import 'package:shifa/features/news/widgets/news_card.dart';
import '../../../core/network/injection_container.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/custom_snackbar.dart';
import '../presentation/cubit/news_state.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

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
              : state is NewsLoaded
                  ? state.newResponseModel.news == null || state.newResponseModel.news!.isEmpty
                      ? EmptyStateWidget(message: context.tr.translate("no_news"))
                      : Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: state.newResponseModel.news?.length ?? 0,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.newsDetails,
                                    arguments: state.newResponseModel.news![index]);
                              },
                              child: NewsCard(
                                newsItem: state.newResponseModel.news![index],
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
