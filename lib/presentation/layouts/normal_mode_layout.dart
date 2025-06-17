import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../widgets/custom_bottom_navigation.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onTap;
  
  const MainLayout({
    Key? key,
    required this.child,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);
  
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
      ),
    );
  }
}
