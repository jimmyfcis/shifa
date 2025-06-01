import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/features/Blogs/presentation/cubit/blogs_cubit.dart';
import 'package:shifa/features/Blogs/presentation/cubit/blogs_state.dart';
import 'package:shifa/features/Blogs/widgets/blog_card.dart';

import '../../../core/network/injection_container.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgtes/custom_snackbar.dart';

class BlogsList extends StatelessWidget {
  const BlogsList({super.key});

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
                  ? Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.blogsResponse.articles?.length ?? 0,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16.h,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.blogDetails,
                                arguments: state.blogsResponse.articles![index]);
                          },
                          child: BlogCard(
                            blog: state.blogsResponse.articles![index],
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
