import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Custom AppBar widget with standard title
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  
  const CustomAppBar({
    super.key,
    this.actions,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        AppConstants.appBarTitle,
        style: TextStyle(fontSize: 14),
      ),
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
