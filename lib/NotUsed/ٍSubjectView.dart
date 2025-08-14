import 'package:fisa_ui_test/NotUsed/Chapter.dart';
import 'package:flutter/material.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  final List<Map<String, dynamic>> allSubjects = [
    {
      'name': 'Physics',
      'price': 10.0,
      'image': 'https://cdn-icons-png.flaticon.com/512/2907/2907253.png',
    },
    {
      'name': 'Biology',
      'price': 12.5,
      'image': 'https://cdn-icons-png.flaticon.com/512/3755/3755306.png',
    },
    {
      'name': 'Chemistry',
      'price': 9.99,
      'image': 'https://cdn-icons-png.flaticon.com/512/2885/2885380.png',
    },
    {
      'name': 'Islamic',
      'price': 0.0,
      'image': 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
    },
  ];

  String? selectedSubjectName;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredSubjects = selectedSubjectName == null
        ? allSubjects
        : allSubjects
              .where((subject) => subject['name'] == selectedSubjectName)
              .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Subjects', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Custom filter dropdown
              Text(
                "Filter by Subject",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _showSubjectDropdown(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedSubjectName ?? "All Subjects",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Grid of subject cards
              Expanded(
                child: GridView.builder(
                  itemCount: filteredSubjects.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final subject = filteredSubjects[index];
                    return _buildSubjectCard(subject);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectCard(Map<String, dynamic> subject) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChaptersPage()),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(subject['image'], fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              subject['name'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subject['price'] == 0.0
                  ? "Free"
                  : "${subject['price'].toStringAsFixed(2)} JOD",
              style: TextStyle(
                fontSize: 14,
                color: subject['price'] == 0.0
                    ? Colors.green
                    : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSubjectDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text("All Subjects"),
                onTap: () {
                  setState(() {
                    selectedSubjectName = null;
                  });
                  Navigator.pop(context);
                },
              ),
              ...allSubjects.map((subject) {
                return ListTile(
                  title: Text(subject['name']),
                  onTap: () {
                    setState(() {
                      selectedSubjectName = subject['name'];
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
