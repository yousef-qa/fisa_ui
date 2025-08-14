import 'package:fisa_ui_test/Lessons/LessonDetailsPage.dart';
import 'package:fisa_ui_test/Lessons/LiveClassCard.dart';
import 'package:flutter/material.dart';

class LiveClassesPage extends StatelessWidget {
  final List<Map<String, dynamic>> classes = [
    {
      'title': 'Mathematics - Algebra',
      'dateTime': DateTime.now().subtract(const Duration(minutes: 20)),
    },
    {
      'title': 'Science - Chemistry',
      'dateTime': DateTime.now().add(const Duration(hours: 30)),
    },
  ];

  LiveClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      body: Column(
        children: [
          SizedBox(height: 10),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: const [
                  Icon(Icons.live_tv_rounded, color: Colors.white, size: 50),
                  SizedBox(width: 12),
                  Text(
                    "Live Lessons",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFEFF6FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  final cls = classes[index];
                  return LiveClassCard(
                    title: cls['title'],
                    dateTime: cls['dateTime'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonDetailsPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
