import 'package:flutter/material.dart';
import 'signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _titleOpacity;
  late Animation<Offset> _titleOffset;

  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _titleOffset =
        Tween<Offset>(begin: const Offset(0, -1.2), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
        );

    _buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _buttonOffset =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/First_Screen.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Title text: slides in from above and fades
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: SlideTransition(
              position: _titleOffset,
              child: FadeTransition(
                opacity: _titleOpacity,
                child: Text(
                  'Cake Tailor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.withOpacity(0.3),
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),

          // Button: slides up and fades
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: SlideTransition(
                position: _buttonOffset,
                child: FadeTransition(
                  opacity: _buttonOpacity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 700),
                          pageBuilder: (context, animation, secondaryAnimation) => const SignupScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            final fadeIn = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );
                            final fadeOut = CurvedAnimation(
                              parent: secondaryAnimation,
                              curve: Curves.easeInOut,
                            );

                            return Stack(
                              children: [
                                FadeTransition(
                                  opacity: fadeOut.drive(Tween<double>(begin: 1.0, end: 0.0)),
                                  child: this.widget, // 👈 splash screen fades out
                                ),
                                FadeTransition(
                                  opacity: fadeIn,
                                  child: child, // 👈 signup screen fades in
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFF7EBDD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 18,
                      ),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
