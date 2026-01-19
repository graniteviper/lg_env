import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App settings'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Icon(
            Icons.settings,
            size: 70,
            color: Colors.cyan,
          ),
          const SizedBox(height: 16),
          const Text(
            'Customize your app experience!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(height: 32),
          SwitchListTile(
            title: const Text('Dark mode'),
            secondary: const Icon(Icons.dark_mode),
            value: themeProvider.isDarkMode,
            onChanged: themeProvider.toggleTheme,
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text('Font size'),
            trailing: DropdownButton<String>(
              value: settingsProvider.fontSize,
              onChanged: (value) {
                if (value != null) {
                  settingsProvider.setFontSize(value);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Font size set to $value'),
                    ),
                  );
                }
              },
              items: const [
                DropdownMenuItem(value: 'Small', child: Text('Small')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Large', child: Text('Large')),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}