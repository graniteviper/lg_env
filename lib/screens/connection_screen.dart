import 'package:flutter/material.dart';
import '../services/lg_service.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _screensController = TextEditingController();

  final LgService _lgService = LgService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    print("DEBUG: Loading settings from preferences...");
    final savedModel = await LgConnectionModel.loadFromPreferences();
    
    if (mounted) {
      setState(() {
        _userController.text = savedModel.username;
        _passwordController.text = savedModel.password;
        _hostController.text = savedModel.ip;
        _portController.text = savedModel.port.toString();
        _screensController.text = savedModel.screens.toString();
      });
      print("DEBUG: Settings loaded. Host: ${savedModel.ip}, User: ${savedModel.username}");
    }
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _hostController.dispose();
    _portController.dispose();
    _screensController.dispose();
    super.dispose();
  }

  Future<void> _handleConnect() async {
    if (_hostController.text.isEmpty || _userController.text.isEmpty) {
      print("DEBUG: Validation failed. Host or User is empty.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });
    print("DEBUG: Starting connection process...");

    int port = int.tryParse(_portController.text) ?? 22;
    int screens = int.tryParse(_screensController.text) ?? 5;

    print("DEBUG: Updating service settings -> IP: ${_hostController.text}, Port: $port, Screens: $screens");
    
    _lgService.updateConnectionSettings(
      ip: _hostController.text,
      username: _userController.text,
      password: _passwordController.text,
      port: port,
      screens: screens,
    );
    print("DEBUG: Attempting to save to preferences...");
    try {
      await _lgService.connectionModel.saveToPreferences()
          .timeout(const Duration(seconds: 2)); 
      print("DEBUG: Settings saved successfully.");
    } catch (e) {
      print("WARNING: Save skipped. Could not save settings (timeout or error): $e");
    }

    try {
      print("DEBUG: Calling initializeConnection()...");
      await _lgService.initializeConnection();
      print("DEBUG: initializeConnection() completed.");
    } catch (e) {
      print("DEBUG: Exception during connection: $e");
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      if (_lgService.isConnected) {
        print("DEBUG: Connection Successful!");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Connected to Liquid Galaxy successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        print("DEBUG: Connection Failed.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Connection failed. Check logs/settings.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connection Settings'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _lgService.isConnected 
                          ? Colors.green.withValues(alpha: 0.1) 
                          : Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _lgService.isConnected ? Colors.green : Colors.red,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _lgService.isConnected ? Icons.check_circle : Icons.error,
                          color: _lgService.isConnected ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          _lgService.isConnected ? "Connected" : "Disconnected",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _lgService.isConnected ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'lg',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'lqgalaxy',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _hostController,
                    decoration: const InputDecoration(
                      labelText: 'IP Address / Host',
                      hintText: '192.168.0.x',
                      prefixIcon: Icon(Icons.computer),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _portController,
                          decoration: const InputDecoration(
                            labelText: 'Port',
                            hintText: '22',
                            prefixIcon: Icon(Icons.settings_ethernet),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _screensController,
                          decoration: const InputDecoration(
                            labelText: 'Screens',
                            hintText: '5',
                            prefixIcon: Icon(Icons.monitor),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _handleConnect,
                      icon: _isLoading 
                        ? const SizedBox(
                            width: 24, 
                            height: 24, 
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                          ) 
                        : const Icon(Icons.link),
                      label: Text(
                        _isLoading ? 'CONNECTING...' : 'CONNECT TO LG',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  
                  if (_lgService.isConnected) ...[
                     const SizedBox(height: 16),
                     SizedBox(
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          _lgService.disconnect();
                          setState(() {});
                          print("DEBUG: Disconnected by user.");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Disconnected from Liquid Galaxy')),
                          );
                        },
                        icon: const Icon(Icons.link_off),
                        label: const Text('DISCONNECT'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
          
          if (_isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}