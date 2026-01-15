import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _adminPasswordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _hostController.dispose();
    _portController.dispose();
    _adminPasswordController.dispose();
    super.dispose();
  }

  void _showValuesPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Connection Details'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(title: const Text('User'), subtitle: Text(_userController.text)),
                ListTile(title: const Text('Password'), subtitle: Text(_passwordController.text)),
                ListTile(title: const Text('Host'), subtitle: Text(_hostController.text)),
                ListTile(title: const Text('Port'), subtitle: Text(_portController.text)),
                ListTile(title: const Text('Admin Password'), subtitle: Text(_adminPasswordController.text)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _userController,
                decoration: const InputDecoration(labelText: 'LG User'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'LG Password'),
                obscureText: true,
              ),
              TextField(
                controller: _hostController,
                decoration: const InputDecoration(labelText: 'LG Host Name'),
              ),
              TextField(
                controller: _portController,
                decoration: const InputDecoration(labelText: 'LG Port'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _adminPasswordController,
                decoration: const InputDecoration(labelText: 'Administration Password'),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _showValuesPopup,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}