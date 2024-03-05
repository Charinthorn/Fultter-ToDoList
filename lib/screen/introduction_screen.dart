import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Honey Toast',
        body: 'Have you enjoy it',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('WElCOME..'),
          ),
        ),
        image: Image.network(
            'https://images.unsplash.com/photo-1484723091739-30a097e8f929?q=80&w=1547&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Salmon was delicious.',
        body: 'Looks like great food',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Let s Eat'),
          ),
        ),
        image: Image.network(
            'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Raspberry Cake',
        body: 'Smooth and soft taste',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Get starts'),
          ),
        ),
        image: Image.network(
            'https://images.unsplash.com/photo-1565958011703-44f9829ba187?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Color.fromARGB(255, 8, 57, 149),
          activeColor: Color.fromARGB(255, 178, 6, 35),
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
