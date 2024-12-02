import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../shared/app_theme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.clearOnPressed,
    this.onSearchPressed,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? clearOnPressed;
  final void Function()? onSearchPressed;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      style: const TextStyle(color: AppTheme.whiteColor),
      cursorColor: AppTheme.whiteColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: clearOnPressed,
          icon: const Icon(Icons.clear, color: AppTheme.whiteColor),
        ),
        prefixIcon: IconButton(
          onPressed: onSearchPressed,
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: AppTheme.whiteColor,
          ),
        ),
        filled: true,
        fillColor: AppTheme.darkLiverColor.withOpacity(0.75),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.whiteColor.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.whiteColor.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.whiteColor.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppTheme.whiteColor.withOpacity(0.8),
            ),
      ),
    );
  }
}
