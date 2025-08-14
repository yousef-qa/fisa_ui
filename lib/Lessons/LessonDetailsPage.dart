import 'package:flutter/material.dart';

class LessonDetailsPage extends StatefulWidget {
  const LessonDetailsPage({super.key});

  @override
  State<LessonDetailsPage> createState() => _LessonDetailsPageState();
}

class _LessonDetailsPageState extends State<LessonDetailsPage> {
  bool showQuestions = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the main purpose of SEO?',
      'options': [
        'Drive traffic',
        'Design logos',
        'Send emails',
        'Translate text',
      ],
    },
    {
      'question': 'Which tool can assist with keyword research?',
      'options': ['ChatGPT', 'Excel', 'Photoshop', 'PowerPoint'],
    },
  ];

  List<String?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<String?>.filled(questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFFF4F6F8);
    const primary = Color(0xFF1E3A8A);
    const accent = Color(0xFF4F46E5);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Lesson: SEO Basics"),
        foregroundColor: Colors.white,
        backgroundColor: primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Video preview
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.black,
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showQuestions = !showQuestions;
                          });
                        },
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: accent,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Preview locked. Tap to switch mode",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: showQuestions
                  ? _buildQuestionsUI(primary, accent)
                  : BuildLessonContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsUI(Color primary, Color accent) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        'Questions about this lesson',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primary,
        ),
      ),
      initiallyExpanded: true,
      iconColor: primary,
      collapsedIconColor: Colors.grey,
      children: [
        ...List.generate(questions.length, (index) {
          final q = questions[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ${q['question']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...List.generate((q['options'] as List).length, (optIndex) {
                    final option = q['options'][optIndex];
                    return RadioListTile<String>(
                      value: option,
                      groupValue: selectedAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[index] = value!;
                        });
                      },
                      title: Text(option),
                      activeColor: accent,
                      contentPadding: EdgeInsets.zero,
                    );
                  }),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {
              // handle submission logic
            },
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Submit Answers'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildLessonContent extends StatelessWidget {
  const BuildLessonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mastering SEO With ChatGPT',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'In this lesson, you will learn how to use ChatGPT to boost your SEO strategies, create effective content, and optimize your website.',
          style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
        ),
        const SizedBox(height: 24),
        Text(
          'Lesson Objectives:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
        const SizedBox(height: 12),
        const BulletPoint(text: "Understand the basics of SEO"),
        const BulletPoint(text: "Use ChatGPT for keyword research"),
        const BulletPoint(text: "Generate optimized blog content"),
      ],
    );
  }
}
