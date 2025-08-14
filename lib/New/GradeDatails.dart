import 'package:fisa_ui_test/New/CartView.dart';
import 'package:fisa_ui_test/child/ChildAccountPage.dart';
import 'package:flutter/material.dart';

class GradeDetailsScreen extends StatefulWidget {
  final String gradeName;

  const GradeDetailsScreen({super.key, required this.gradeName});

  @override
  State<GradeDetailsScreen> createState() => _GradeDetailsScreenState();
}

class _GradeDetailsScreenState extends State<GradeDetailsScreen> {
  final List<Map<String, dynamic>> subjects = [
    {'name': 'Math', 'price': 20.0},
    {'name': 'Science', 'price': 25.0},
    {'name': 'English', 'price': 18.0},
    {'name': 'History', 'price': 15.0},
  ];

  final Set<int> selectedIndexes = {};

  void toggleAll(bool selectAll) {
    setState(() {
      if (selectAll) {
        selectedIndexes.addAll(List.generate(subjects.length, (i) => i));
      } else {
        selectedIndexes.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FB),
      appBar: AppBar(
        title: Text(widget.gradeName),
        backgroundColor: Colors.indigo.shade800,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () =>
                  toggleAll(selectedIndexes.length != subjects.length),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                selectedIndexes.length == subjects.length
                    ? 'Unselect All'
                    : 'Select All Subjects',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                final isSelected = selectedIndexes.contains(index);

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(subject['name']),
                    subtitle: Text('\$${subject['price'].toStringAsFixed(2)}'),
                    trailing: Checkbox(
                      value: isSelected,
                      onChanged: (_) {
                        setState(() {
                          if (isSelected) {
                            selectedIndexes.remove(index);
                          } else {
                            selectedIndexes.add(index);
                          }
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: SizedBox(
              width: double.infinity,
              child: ShineButton(
                text: 'Add to Cart',
                onPressed: selectedIndexes.isEmpty
                    ? null
                    : () {
                        final selectedSubjects = selectedIndexes
                            .map((i) => subjects[i])
                            .toList();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CartScreen(cartItems: selectedSubjects),
                          ),
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
