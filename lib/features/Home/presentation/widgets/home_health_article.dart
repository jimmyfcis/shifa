import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/theme/styles.dart';
import 'package:shifa/core/theme/theme.dart';
import 'package:shifa/features/Home/presentation/widgets/article_card.dart';
import '../../../../core/network/injection_container.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgtes/custom_snackbar.dart';
import '../../../Blogs/presentation/cubit/blogs_cubit.dart';
import '../../../Blogs/presentation/cubit/blogs_state.dart';

class HomeHealthArticle extends StatelessWidget {
  const HomeHealthArticle({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return BlocProvider(
      create: (context) => sl<BlogsCubit>()..getBlogs(),
      child: BlocConsumer<BlogsCubit, BlogsState>(
        listener: (context, state) {
          if (state is BlogsFailure) {
            showCustomSnackBar(context, state.message, isError: true, statusCode: state.statusCode);
          }
        },
        builder: (context, state) {
          return state is BlogsLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: themeProvider.currentThemeData!.primaryColor,
                ))
              : state is BlogsLoaded
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, AppRoutes.bottomBar, arguments: {
                                "index": 4,
                              });
                              Navigator.pushNamed(context, AppRoutes.blogs);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  context.tr.translate('health_article'),
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
                            itemCount: state.blogsResponse.articles?.length ?? 0,
                            itemBuilder: (context, index) => ArticleCard(blog: state.blogsResponse.articles![index]),
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
