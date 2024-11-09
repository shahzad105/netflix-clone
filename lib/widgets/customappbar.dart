import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBarButton(
                    title: "TV Shows",
                    onTab: () => print("TV Shows"),
                  ),
                  AppBarButton(
                    title: "Movies",
                    onTab: () => print("Movies"),
                  ),
                  AppBarButton(
                    title: "My List",
                    onTab: () => print("My List"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTab;

  const AppBarButton({super.key, required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
