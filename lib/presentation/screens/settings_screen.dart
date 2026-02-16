import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../domain/providers/theme_provider.dart';
import '../../data/repositories/settings_repository.dart';
import 'about_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _repo = SettingsRepository();
  final _hodController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHODName();
  }

  Future<void> _loadHODName() async {
    final name = await _repo.getHODName();
    _hodController.text = name;
  }

  Future<void> _saveHODName() async {
    await _repo.setHODName(_hodController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('HOD Name saved')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDark,
            onChanged: (_) => ref.read(themeModeProvider.notifier).toggleTheme(),
          ),
          const Divider(),
          ListTile(
            title: const Text('HOD Name'),
            subtitle: TextField(
              controller: _hodController,
              decoration: const InputDecoration(hintText: 'Enter HOD Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: _saveHODName,
              child: const Text('Save HOD Name'),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
