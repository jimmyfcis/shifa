import 'package:flutter/material.dart';
import 'package:shifa/core/localization/app_extensions.dart';
import 'package:shifa/core/routes/app_routes.dart';
import 'package:shifa/features/departments/data/models/department_model.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentCard({
    super.key,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              department.title ?? "",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              department.description ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.departmentDetails,
                      arguments: {
                        "department": department,
                      },
                    );
                  },
                  child:  Text(context.tr.translate("view_details")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
