import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/settings_repository.dart';

final settingsRepoProvider = Provider((ref) => SettingsRepository());

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, bool>((ref) {
  return ThemeModeNotifier(ref.read(settingsRepoProvider));
});

class ThemeModeNotifier extends StateNotifier<bool> {
  final SettingsRepository _repo;
  
  ThemeModeNotifier(this._repo) : super(false) {
    _loadTheme();
  }
  
  Future<void> _loadTheme() async {
    state = await _repo.getThemeMode();
  }
  
  Future<void> toggleTheme() async {
    state = !state;
    await _repo.setThemeMode(state);
  }
}
