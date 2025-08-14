import 'package:fisa_ui_test/NotUsed/%D9%8DSubjectView.dart';
import 'package:flutter/material.dart';

class SelectClassView extends StatefulWidget {
  const SelectClassView({super.key});

  @override
  State<SelectClassView> createState() => _SelectClassViewState();
}

class _SelectClassViewState extends State<SelectClassView> {
  String? selectedSystem;
  int? selectedGrade;
  String? selectedCountry;

  final List<String> countries = [
    'Jordan',
    'Saudi Arabia',
    'United Arab Emirates',
    'Egypt',
    'Qatar',
    'Kuwait',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Select School System & Class",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Which class or Grade are you in?",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Country Dropdown
              _buildDropdown<String>(
                value: selectedCountry,
                hint: "Select Country",
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // School System Dropdown
              _buildDropdown<String>(
                value: selectedSystem,
                hint: "School System",
                items: const ["International", "Local", "Islamic"],
                onChanged: (value) {
                  setState(() {
                    selectedSystem = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Grade Numbers Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: isSmallScreen ? 3 : 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                  children: List.generate(12, (index) {
                    int grade = index + 1;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGrade = grade;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: selectedGrade == grade
                                ? Colors.deepPurple
                                : Colors.grey.shade300,
                            width: selectedGrade == grade ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "$grade",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: selectedGrade == grade
                                  ? Colors.deepPurple
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      (selectedCountry != null &&
                          selectedSystem != null &&
                          selectedGrade != null)
                      ? () {
                          // Navigate to next page

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectsPage(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    "CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required void Function(T?) onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          hint: Text(hint),
          value: value,
          items: items
              .map(
                (e) => DropdownMenuItem<T>(value: e, child: Text(e.toString())),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
