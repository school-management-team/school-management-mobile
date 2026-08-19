import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/core/themes/cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        bool isDark = themeMode == ThemeMode.dark;

        return GestureDetector(
          onTap: () {
           
            context.read<ThemeCubit>().toggleTheme(!isDark);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? Colors.grey[800] : Colors.amber.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Icon(
                isDark ? Icons.nightlight_round_outlined : Icons.wb_sunny_rounded,
                key: ValueKey<bool>(isDark),
                color: isDark ? Colors.blueGrey : Colors.amber,
                size: 40.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}