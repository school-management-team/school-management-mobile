import 'package:flutter/material.dart';
import 'package:school/Feature/auth/signup/presentation/view/role_selection_body_view.dart';

class RoleSelectionView extends StatelessWidget {
  const RoleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const RoleSelectionBodyView()
      
      ),
    );
  }
}