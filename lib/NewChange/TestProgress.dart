import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressDashboard extends StatefulWidget {
  @override
  _ProgressDashboardState createState() => _ProgressDashboardState();
}

class _ProgressDashboardState extends State<ProgressDashboard> {
  // Mock data - replace with your backend data
  final List<CourseProgress> courses = [
    CourseProgress(
      courseId: 1,
      courseName: "Mathematics",
      progress: 0.35,
      totalLessons: 24,
      completedLessons: 8,
      units: [
        CourseUnit(
          unitId: 1,
          unitName: "Algebra Basics",
          progress: 0.6,
          lessons: [
            Lesson(lessonId: 1, title: "Variables", isCompleted: true),
            Lesson(lessonId: 2, title: "Equations", isCompleted: true),
            Lesson(lessonId: 3, title: "Polynomials", isCompleted: false),
          ],
        ),
        CourseUnit(
          unitId: 2,
          unitName: "Geometry",
          progress: 0.2,
          lessons: [
            Lesson(lessonId: 4, title: "Angles", isCompleted: true),
            Lesson(lessonId: 5, title: "Triangles", isCompleted: false),
            Lesson(lessonId: 6, title: "Circles", isCompleted: false),
          ],
        ),
      ],
    ),
    CourseProgress(
      courseId: 2,
      courseName: "Science",
      progress: 0.15,
      totalLessons: 18,
      completedLessons: 3,
      units: [
        CourseUnit(
          unitId: 3,
          unitName: "Physics",
          progress: 0.25,
          lessons: [
            Lesson(lessonId: 7, title: "Motion", isCompleted: true),
            Lesson(lessonId: 8, title: "Forces", isCompleted: false),
          ],
        ),
      ],
    ),
    CourseProgress(
      courseId: 3,
      courseName: "Literature",
      progress: 0.0,
      totalLessons: 12,
      completedLessons: 0,
      units: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Learning Progress',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Refresh data
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Cards
            _buildOverviewCards(),
            SizedBox(height: 24),

            // Progress Chart
            _buildProgressChart(),
            SizedBox(height: 24),

            // Courses List
            Text(
              'My Courses',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ...courses.map((course) => _buildCourseCard(course)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards() {
    final totalCourses = courses.length;
    final totalLessons = courses.fold(
      0,
      (sum, course) => sum + course.totalLessons,
    );
    final completedLessons = courses.fold(
      0,
      (sum, course) => sum + course.completedLessons,
    );
    final progressPercentage = completedLessons / totalLessons;

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Courses',
            value: totalCourses.toString(),
            icon: Icons.menu_book,
            color: Colors.blue,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Lessons',
            value: '$completedLessons/$totalLessons',
            icon: Icons.check_circle,
            color: Colors.green,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Progress',
            value: '${(progressPercentage * 100).toStringAsFixed(1)}%',
            icon: Icons.trending_up,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressChart() {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,

      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overall Progress',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 16),
            LinearProgressIndicator(
              value:
                  courses.fold(0.0, (sum, course) => sum + course.progress) /
                  courses.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 12,
              borderRadius: BorderRadius.circular(6),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(courses.fold(0.0, (sum, course) => sum + course.progress) / courses.length * 100).toStringAsFixed(1)}% Complete',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${courses.fold(0, (sum, course) => sum + course.completedLessons)}/${courses.fold(0, (sum, course) => sum + course.totalLessons)} Lessons',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(CourseProgress course) {
    return Card(
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                course.courseName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(width: 8),
            CircularPercentIndicator(
              radius: 20,
              lineWidth: 3,
              percent: course.progress,
              progressColor: _getProgressColor(course.progress),
              backgroundColor: Colors.grey[200]!,
              center: Text(
                '${(course.progress * 100).toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            '${course.completedLessons}/${course.totalLessons} lessons completed',
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ),
        children: [
          if (course.units.isEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'No units available yet',
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
            ...course.units.map((unit) => _buildUnitTile(unit)).toList(),
        ],
      ),
    );
  }

  Widget _buildUnitTile(CourseUnit unit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  unit.unitName,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '${(unit.progress * 100).toStringAsFixed(0)}%',
                style: TextStyle(
                  color: _getProgressColor(unit.progress),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: unit.progress,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              _getProgressColor(unit.progress),
            ),
            minHeight: 4,
            borderRadius: BorderRadius.circular(2),
          ),
          SizedBox(height: 12),
          ...unit.lessons.map((lesson) => _buildLessonTile(lesson)).toList(),
        ],
      ),
    );
  }

  Widget _buildLessonTile(Lesson lesson) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: lesson.isCompleted ? Colors.green[50] : Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            lesson.isCompleted ? Icons.check : Icons.play_arrow,
            color: lesson.isCompleted ? Colors.green : Colors.grey,
            size: 18,
          ),
        ),
        title: Text(
          lesson.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: lesson.isCompleted ? Colors.black : Colors.grey[700],
          ),
        ),
        trailing: Text(
          lesson.isCompleted ? 'Completed' : 'Pending',
          style: TextStyle(
            color: lesson.isCompleted ? Colors.green : Colors.orange,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Color _getProgressColor(double progress) {
    if (progress < 0.3) return Colors.red;
    if (progress < 0.7) return Colors.orange;
    return Colors.green;
  }
}

// Data Models
class CourseProgress {
  final int courseId;
  final String courseName;
  final double progress;
  final int totalLessons;
  final int completedLessons;
  final List<CourseUnit> units;

  CourseProgress({
    required this.courseId,
    required this.courseName,
    required this.progress,
    required this.totalLessons,
    required this.completedLessons,
    required this.units,
  });
}

class CourseUnit {
  final int unitId;
  final String unitName;
  final double progress;
  final List<Lesson> lessons;

  CourseUnit({
    required this.unitId,
    required this.unitName,
    required this.progress,
    required this.lessons,
  });
}

class Lesson {
  final int lessonId;
  final String title;
  final bool isCompleted;

  Lesson({
    required this.lessonId,
    required this.title,
    required this.isCompleted,
  });
}
