import 'package:fisa_ui_test/child/AddSubscription.dart';
import 'package:fisa_ui_test/child/ChildAccountPage.dart';
import 'package:fisa_ui_test/child/ChildPerformanceScreen.dart';
import 'package:fisa_ui_test/child/ChildSubscriptions.dart';
import 'package:flutter/material.dart';

class ChildDetailsScreen extends StatelessWidget {
  const ChildDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FB),
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade800,
        elevation: 0,
        title: const Text(
          'Children',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Profile Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Color(0xFFE0F2FF),
                  child: Icon(Icons.person, size: 40, color: Colors.black54),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ahmad Abdullah Hussein',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Student in 2nd Grade ',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),

          const Divider(height: 32, thickness: 0.5, color: Colors.grey),

          // Options List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                OptionButton(
                  label: 'View Child Account',
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildAccountScreen(),
                      ),
                    );
                  },
                ),
                OptionButton(
                  label: 'Child Performance & Info',
                  icon: Icons.person_outline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildPerformanceScreen(),
                      ),
                    );
                  },
                ),
                OptionButton(
                  label: 'Child Subscriptions',
                  icon: Icons.newspaper,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChildSubscriptionsScreen(),
                      ),
                    );
                  },
                ),
                OptionButton(
                  label: 'Add Subscription',
                  icon: Icons.add_card_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddSubscriptionScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class OptionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  void Function()? onTap;
  OptionButton({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: const Color(0xFFD7E2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: Icon(icon, color: Colors.indigo),
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
