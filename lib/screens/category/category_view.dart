import 'package:flutter/material.dart';

import '../../models/model.dart';
import 'widget/category_screen.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryScreen(
        category: category,
      ),
    );
  }
}
