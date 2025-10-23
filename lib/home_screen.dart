import 'package:flutter/material.dart';
import 'package:navigator_animation/widgets/navigator_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numOfDots = 4;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F9),
                  borderRadius: BorderRadius.all(Radius.circular(80)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavigatorButton(
                      icon: Icons.arrow_back_ios_rounded,
                      onTap: () {
                        setState(() {
                          _selectedIndex--;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        spacing: 8,
                        children: List.generate(
                          numOfDots,
                          (index) =>
                              Indicator(isActive: index == _selectedIndex),
                        ),
                      ),
                    ),
                    NavigatorButton(
                      icon: Icons.arrow_forward_ios_rounded,
                      isActive: true,
                      onTap: () {
                        setState(() {
                          _selectedIndex++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: isActive ? 48 : 12,
      decoration: BoxDecoration(
        color: Color(0xFFDAD9E4),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
