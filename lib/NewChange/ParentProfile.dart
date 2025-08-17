import 'package:fisa_ui_test/NewChange/EditProfile.dart';
import 'package:fisa_ui_test/NewChange/SettingPage.dart';
import 'package:fisa_ui_test/NewChange/TestProgress.dart';
import 'package:fisa_ui_test/NewChange/MyChildrenPage.dart';
import 'package:flutter/material.dart';

class ParentProfile extends StatelessWidget {
  final String userName = 'Mohammad Qasrawi';
  final String userEmail = 'elqasrawi@icloud.com';

  const ParentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFD),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildProfileHeader(),
              collapseMode: CollapseMode.parallax,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,

            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [SizedBox(height: 32), _buildActionGrid(context)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6E8AFA), Color(0xFF947EFB)],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  'https://randomuser.me/api/portraits/men/42.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 130,
          left: 10,
          right: 0,
          child: Column(
            children: [
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                userEmail,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    final actions = [
      {
        'icon': Icons.edit,
        'color': Color(0xFF6E8AFA),
        'title': 'Edit Profile',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ModernEditProfile()),
          );
        },
      },
      {
        'icon': Icons.child_care,
        'color': Color(0xFFFD7E77),
        'title': 'My Children',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyChildrenPage()),
          );
        },
      },
      {
        'icon': Icons.assessment,
        'color': Color(0xFF5FD0D3),
        'title': 'My Progress',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProgressDashboard()),
          );
        },
      },
      {
        'icon': Icons.credit_card,
        'color': Color(0xFFF6C34F),
        'title': 'Subscriptions',
      },
      {
        'icon': Icons.settings,
        'color': Color(0xFF947EFB),
        'title': 'Settings',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        },
      },
      {
        'icon': Icons.exit_to_app,
        'color': Color(0xFFFD7E77),
        'title': 'Log Out',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 50,
        childAspectRatio: 0.8,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: actions[index]['onTap'] as void Function()?,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: actions[index]['color'] as Color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    actions[index]['icon'] as IconData,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  actions[index]['title'] as String,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
