import 'package:fisa_ui_test/Lessons/LessonDetailsPage.dart';
import 'package:flutter/material.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chapters = [
      {
        'name': 'Chapter 1: Basics',
        'lessons': [
          {
            'name': 'Lesson 1.1',
            'content': 'Introduction to the basics.',
            'objectives': 'Understand basic concepts.',
          },
          {
            'name': 'Lesson 1.2',
            'content': 'Detailed explanation.',
            'objectives': 'Apply the learned basics.',
          },
        ],
      },
      {
        'name': 'Chapter 2: Advanced Topics',
        'lessons': [
          {
            'name': 'Lesson 2.1',
            'content': 'Advanced theory.',
            'objectives': 'Master advanced concepts.',
          },
        ],
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapters'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: chapters.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          final lessons = chapter['lessons'] as List<Map<String, String>>;
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              title: Text(
                chapter['name'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              children: lessons.map((lesson) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.deepPurple,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        lesson['name'] ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            'Content: ${lesson['content'] ?? ''}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Objectives: ${lesson['objectives'] ?? ''}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonDetailsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
