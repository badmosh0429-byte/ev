import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/settings_repository.dart';
import '../providers/theme_provider.dart';

final hodNameProvider = FutureProvider<String>((ref) async {
  final repo = ref.read(settingsRepoProvider);
  return await repo.getHODName();
});
