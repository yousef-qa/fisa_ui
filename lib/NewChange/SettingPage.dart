import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey[800]),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // App Preferences
                _buildSectionTitle('App Preferences'),
                const SizedBox(height: 12),
                _buildSettingsCard(
                  children: [
                    _buildSwitchTile(
                      icon: FontAwesomeIcons.bell,
                      title: 'Notifications',
                      value: _notificationsEnabled,
                      onChanged: (v) =>
                          setState(() => _notificationsEnabled = v),
                    ),
                    _buildDivider(),
                    _buildSwitchTile(
                      icon: FontAwesomeIcons.moon,
                      title: 'Dark Mode',
                      value: _darkModeEnabled,
                      onChanged: (v) => setState(() => _darkModeEnabled = v),
                    ),
                    _buildDivider(),

                    _buildDropdownTile(
                      icon: FontAwesomeIcons.language,
                      title: 'Language',
                      value: _selectedLanguage,
                      items: const ['English', 'Arabic'],
                      onChanged: (v) => setState(() => _selectedLanguage = v!),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Help & Support
                _buildSectionTitle('Help & Support'),
                const SizedBox(height: 12),
                _buildSettingsCard(
                  children: [
                    _buildListTile(
                      icon: FontAwesomeIcons.circleQuestion,
                      title: 'Help Center',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      icon: FontAwesomeIcons.envelope,
                      title: 'Contact Us',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Legal
                _buildSectionTitle('Legal'),
                const SizedBox(height: 12),
                _buildSettingsCard(
                  children: [
                    _buildListTile(
                      icon: FontAwesomeIcons.shield,
                      title: 'Privacy Policy',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      icon: FontAwesomeIcons.fileContract,
                      title: 'Terms of Service',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // App Info
                _buildSectionTitle('About App'),
                const SizedBox(height: 12),
                _buildSettingsCard(
                  children: [
                    _buildListTile(
                      icon: FontAwesomeIcons.infoCircle,
                      title: 'Version',
                      trailing: Text(
                        '1.2.3',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      icon: FontAwesomeIcons.star,
                      title: 'Rate App',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      icon: FontAwesomeIcons.shareNodes,
                      title: 'Share App',
                      onTap: () {},
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSettingsCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.blueAccent.shade700),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ),
              trailing ??
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: Colors.grey[400],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return _buildListTile(
      icon: icon,
      title: title,
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blueAccent.shade700,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }

  Widget _buildDropdownTile({
    required IconData icon,
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return _buildListTile(
      icon: icon,
      title: title,
      trailing: DropdownButton<String>(
        value: value,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.grey[800], fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: const SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey[600]),
        style: TextStyle(color: Colors.grey[800], fontSize: 14),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 52,
      endIndent: 16,
      color: Colors.grey[100],
    );
  }
}
