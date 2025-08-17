import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChildSubscriptionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> studentSubscriptions = [
    {
      'ClassRoom': 'ClassRoom 6',
      'subjects': [
        {
          'name': 'Mathematics',
          'progress': 0.65,
          'icon': FontAwesomeIcons.squareRootVariable,
        },
        {'name': 'Science', 'progress': 0.42, 'icon': FontAwesomeIcons.flask},
      ],
    },
    {
      'ClassRoom': 'ClassRoom 8',
      'subjects': [
        {
          'name': 'English Literature',
          'progress': 0.78,
          'icon': FontAwesomeIcons.bookOpen,
        },
        {'name': 'Biology', 'progress': 0.35, 'icon': FontAwesomeIcons.dna},
      ],
    },
  ];

  ChildSubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Student Subscriptions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary Card
            _buildSummaryCard(),
            const SizedBox(height: 24),

            // Subscriptions List
            ...studentSubscriptions.map((grade) {
              return _buildGradeSubscriptionCard(context, grade);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.blue[800],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  FontAwesomeIcons.bookBookmark,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Subscription Summary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(
                  'Total Grades',
                  '2',
                  FontAwesomeIcons.graduationCap,
                ),
                _buildSummaryItem(
                  'Active Subjects',
                  '4',
                  FontAwesomeIcons.bookOpenReader,
                ),
                _buildSummaryItem(
                  'Completion',
                  '55%',
                  FontAwesomeIcons.circleCheck,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.8), size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildGradeSubscriptionCard(
    BuildContext context,
    Map<String, dynamic> grade,
  ) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shadowColor: Colors.indigo,

      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.school,
                    color: Colors.blue[800],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  grade['ClassRoom'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...(grade['subjects'] as List).map((subject) {
              return _buildSubjectTile(context, subject);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectTile(BuildContext context, Map<String, dynamic> subject) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    subject['icon'],
                    size: 20,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    subject['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.chevronRight, size: 16),
                  onPressed: () {
                    // Navigate to subject details
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: subject['progress'],
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]!),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(subject['progress'] * 100).toInt()}% completed',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                TextButton(
                  onPressed: () {
                    // View progress details
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                  ),
                  child: const Text(
                    'View Progress',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
