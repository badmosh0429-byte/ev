import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/settings_repository.dart';
import 'dashboard_screen.dart';

class PinLockScreen extends ConsumerStatefulWidget {
  const PinLockScreen({super.key});
  @override
  ConsumerState<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends ConsumerState<PinLockScreen> {
  final _pinController = TextEditingController();
  final _repo = SettingsRepository();
  String? _savedPin;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkPin();
  }

  Future<void> _checkPin() async {
    _savedPin = await _repo.getPIN();
    setState(() => _isLoading = false);
  }

  Future<void> _verifyOrSetPin() async {
    final pin = _pinController.text;
    if (pin.length != 4) return;

    if (_savedPin == null) {
      await _repo.setPIN(pin);
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
      }
    } else if (_savedPin == pin) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect PIN')),
      );
      _pinController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(_savedPin == null ? 'Set PIN' : 'Enter PIN')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pinController,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 4,
              decoration: const InputDecoration(
                labelText: '4-Digit PIN',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _verifyOrSetPin(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOrSetPin,
              child: Text(_savedPin == null ? 'Set PIN' : 'Unlock'),
            ),
          ],
        ),
      ),
    );
  }
}
