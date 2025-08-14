import 'package:fisa_ui_test/Parent/AddChildPage.dart';
import 'package:fisa_ui_test/child/ChildDatailsView.dart';
import 'package:flutter/material.dart';

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FB),
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.indigo.shade200,
        elevation: 0,
        title: const Text(
          'Abdullah Hussein',
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.indigo.shade200),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Add Child Section
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddChildPage()),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F4FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.person_add,
                        size: 40,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Add Child',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Child List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => ChildCard(
                  name: "Ahmad Abdullah Hussein",
                  grade: "Student in 2nd Grade ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChildCard extends StatelessWidget {
  final String name;
  final String grade;

  const ChildCard({super.key, required this.name, required this.grade});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 34,
            backgroundColor: Color(0xFFE0F2FF),
            child: Icon(Icons.person, color: Colors.black54),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(grade, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChildDetailsScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text("Details", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
