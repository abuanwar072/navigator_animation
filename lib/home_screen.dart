import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            FlutterLogo(size: 64),
            SizedBox(height: 8),
            Text(
              "By The Flutter Way",
              style: TextTheme.of(context).titleMedium,
            ),
            Spacer(),
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex--;
                        });
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFFDAD9E4),
                        child: Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        spacing: 8,
                        children: List.generate(
                          4,
                          (index) =>
                              Indicator(isActive: index == _selectedIndex),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex++;
                        });
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFF2B2B2E),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
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
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      duration: Duration(milliseconds: 900),
      curve: Curves.elasticOut,
      height: 12,
      width: isActive ? 48 : 12,
      decoration: BoxDecoration(
        color: Color(0xFFDAD9E4),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          width: isActive ? 42 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
