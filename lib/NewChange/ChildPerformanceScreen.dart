import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ModernChildPerformanceScreen extends StatelessWidget {
  const ModernChildPerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Child Performance',
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
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Quick Stats Row
            _buildQuickStatsRow(),
            const SizedBox(height: 24),

            // Subject Performance Section
            _buildSubjectPerformanceSection(),
            const SizedBox(height: 24),

            // Progress Chart
            _buildProgressChart(),
            const SizedBox(height: 24),

            // Detailed Stats
            _buildDetailedStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: FontAwesomeIcons.clock,
            value: '1d 12h',
            label: 'Time Spent',
            color: Colors.blue[800]!,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: FontAwesomeIcons.bookOpen,
            value: '2/4',
            label: 'Subjects',
            color: Colors.green[700]!,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            value: 'Top 15%',
            label: 'Ranking',
            icon: FontAwesomeIcons.arrowTrendUp,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildSubjectPerformanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Subject Performance',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.microscope,
                size: 20,
                color: Colors.blue,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Science Subject',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Icon(
                FontAwesomeIcons.chevronDown,
                size: 16,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressChart() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weekly Progress',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(fontSize: 10),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 100,
                interval: 20,
                labelStyle: const TextStyle(fontSize: 10),
              ),
              series: [
                ColumnSeries<ChartData, String>(
                  dataSource: [
                    ChartData('Mon', 35),
                    ChartData('Tue', 45),
                    ChartData('Wed', 65),
                    ChartData('Thu', 70),
                    ChartData('Fri', 55),
                    ChartData('Sat', 80),
                    ChartData('Sun', 60),
                  ],
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.score,
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedStats() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: [
        _buildDetailedStatCard(
          value: '7/15',
          label: 'Completed Lessons',
          progress: 0.47,
          color: Colors.blue[800]!,
        ),
        _buildDetailedStatCard(
          value: '22/125',
          label: 'Correct Answers',
          progress: 0.18,
          color: Colors.green[700]!,
        ),
        _buildDetailedStatCard(
          value: '70%',
          label: 'Performance',
          progress: 0.7,
          color: Colors.orange[800]!,
        ),
        _buildDetailedStatCard(
          value: '8h 45m',
          label: 'Study Time',
          progress: 0.65,
          color: Colors.purple[800]!,
        ),
      ],
    );
  }

  Widget _buildDetailedStatCard({
    required String value,
    required String label,
    required double progress,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}

class ChartData {
  final String day;
  final int score;

  ChartData(this.day, this.score);
}
