import 'package:flutter/material.dart';

class AddChildPage extends StatelessWidget {
  const AddChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Child"),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.indigo.shade800,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Student Info",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Full Name
              const Text("Full Name"),
              const SizedBox(height: 6),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter full name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Grade Level
              const Text("Grade Level"),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                items: List.generate(12, (index) {
                  return DropdownMenuItem(
                    value: 'Grade ${index + 1}',
                    child: Text('Grade ${index + 1}'),
                  );
                }),
                onChanged: (value) {},
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),

              // Image Picker (Optional)
              const Text("Student Image (Optional)"),
              const SizedBox(height: 6),
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Email
              const Text("Student Email"),
              const SizedBox(height: 6),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              const Text("Password"),
              const SizedBox(height: 6),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Country
              const Text("Country"),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: "Jordan", child: Text("Jordan")),
                  DropdownMenuItem(value: "KSA", child: Text("Saudi Arabia")),
                  DropdownMenuItem(value: "UAE", child: Text("UAE")),
                  DropdownMenuItem(value: "Qatar", child: Text("Qatar")),
                  DropdownMenuItem(value: "Egypt", child: Text("Egypt")),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),

              // Education System
              const Text("Education System"),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: "Local", child: Text("Local")),
                  DropdownMenuItem(value: "Islamic", child: Text("Islamic")),
                  DropdownMenuItem(
                    value: "International",
                    child: Text("International"),
                  ),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Handle submission
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Submit", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
