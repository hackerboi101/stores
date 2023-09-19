import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(height: 3),
            const Text(
              'Stores',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(120, 50, 143, 1),
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
