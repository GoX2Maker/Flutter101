import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

enum Direction { left, right }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        ), (route) {
      return false;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      // to the right
      _direction = Direction.right;
    } else {
      // to the left
      _direction = Direction.left;
    }
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.right) {
      _showingPage = Page.first;
    }
    if (_direction == Direction.left) {
      _showingPage = Page.second;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    "Watch cool videos!",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    "Follow the rules!",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size48,
            horizontal: Sizes.size24,
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showingPage == Page.second ? 1 : 0,
            child: CupertinoButton(
              onPressed: _onEnterAppTap,
              color: Theme.of(context).primaryColor,
              child: const Text("Enter the app!"),
            ),
          ),
        ),
      ),
    );
  }
}
