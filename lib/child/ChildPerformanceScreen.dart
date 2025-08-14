import 'package:flutter/material.dart';

class ChildPerformanceScreen extends StatelessWidget {
  const ChildPerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FB),
      appBar: AppBar(
        title: const Text('Student Performance'),
        backgroundColor: Colors.indigo.shade800,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoChip(
                  icon: Icons.timer_outlined,
                  title: 'Time Spent in App',
                  value: '1 day, 12 hrs',
                ),
                _infoChip(
                  icon: Icons.bookmark_outline,
                  title: 'Subjects In Progress',
                  value: '2 subjects',
                ),
              ],
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Color(0xFF7A60F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Student Overall Performance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Measures the percentage of correct answers out of total questions, comparing performance before and after foundation level.',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _CircleStat(percent: 80, label: 'With Foundation'),
                      _CircleStat(percent: 70, label: 'Before Foundation'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // General Performance Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'General Performance',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD7E2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Text(
                    'Science Subject',
                    style: TextStyle(color: Colors.indigo),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down, color: Colors.indigo),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // My Ranking in Subject
            Row(
              children: const [
                Icon(Icons.emoji_events_outlined, color: Colors.deepOrange),
                SizedBox(width: 8),
                Text('My Ranking in Subject', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 12),

            // Stats Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _SmallStatCard(percentText: '7/15', label: 'Completed Lessons'),
                _SmallStatCard(
                  percentText: '22/125',
                  label: 'Correctly Answered Questions',
                ),
                _SmallStatCard(
                  percentText: '70%',
                  label: 'Performance in Subject',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.indigo),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleStat extends StatelessWidget {
  final int percent;
  final String label;

  const _CircleStat({required this.percent, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: CircularProgressIndicator(
                value: percent / 100,
                strokeWidth: 8,
                backgroundColor: Colors.white30,
                color: Colors.orangeAccent,
              ),
            ),
            Text(
              '$percent%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _SmallStatCard extends StatelessWidget {
  final String percentText;
  final String label;

  const _SmallStatCard({required this.percentText, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    value: 0.7,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade200,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  percentText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
