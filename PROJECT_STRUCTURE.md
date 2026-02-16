# EV - Student Manager - Project Structure

## Complete File List

### Root Configuration
- pubspec.yaml (dependencies and app metadata)
- analysis_options.yaml (linting rules)
- .gitignore (version control exclusions)
- LICENSE (MIT License)
- README.md (comprehensive documentation)

### GitHub Actions CI/CD
- .github/workflows/android.yml (automatic APK build)

### Android Native
- android/app/build.gradle (app-level build config)
- android/build.gradle (project-level build config)
- android/settings.gradle (Gradle settings)
- android/gradle.properties (Gradle properties)
- android/app/src/main/AndroidManifest.xml (app manifest with permissions)
- android/app/src/main/kotlin/com/ev/studentmanager/MainActivity.kt (entry point)

### Flutter Source (lib/)

#### Core Layer
**Constants:**
- lib/core/constants/app_colors.dart (color scheme)
- lib/core/constants/app_constants.dart (app-wide constants)
- lib/core/constants/app_theme.dart (Material 3 theme)

**Utils:**
- lib/core/utils/date_formatter.dart (date formatting utilities)
- lib/core/utils/message_formatter.dart (SMS/WhatsApp message formatting)

**Widgets:**
- lib/core/widgets/app_bar_widget.dart (custom app bar)
- lib/core/widgets/color_tag_selector.dart (color tag selector)
- lib/core/widgets/loading_widget.dart (loading indicator)

#### Data Layer
**Database:**
- lib/data/database/database_helper.dart (SQLite database setup)

**Models:**
- lib/data/models/class_model.dart (class entity)
- lib/data/models/student_model.dart (student entity)

**Repositories:**
- lib/data/repositories/class_repository.dart (class data operations)
- lib/data/repositories/student_repository.dart (student data operations)
- lib/data/repositories/settings_repository.dart (settings & security)

#### Domain Layer
**Providers:**
- lib/domain/providers/theme_provider.dart (theme state management)
- lib/domain/providers/class_provider.dart (class state management)
- lib/domain/providers/student_provider.dart (student state management)
- lib/domain/providers/settings_provider.dart (settings state management)

#### Presentation Layer
**Screens:**
- lib/presentation/screens/splash_screen.dart (entry point)
- lib/presentation/screens/pin_lock_screen.dart (4-digit PIN security)
- lib/presentation/screens/dashboard_screen.dart (main dashboard with 12 classes)
- lib/presentation/screens/class_screen.dart (class detail with 55 roll numbers)
- lib/presentation/screens/student_detail_screen.dart (student profile management)
- lib/presentation/screens/settings_screen.dart (app settings)
- lib/presentation/screens/about_screen.dart (about information)

#### Main Entry
- lib/main.dart (app initialization)

### Assets
- assets/logo.png (app logo placeholder)
- assets/images/ (student photos directory)

## Architecture Overview

### Clean Architecture Layers
1. **Presentation** → UI and user interactions
2. **Domain** → Business logic and state management
3. **Data** → Database operations and data models
4. **Core** → Shared utilities and constants

### State Management
- Riverpod 2.x for reactive state management
- FutureProvider for async data loading
- StateNotifierProvider for mutable state

### Database Schema
1. **classes** (12 pre-populated classes)
2. **roll_numbers** (55 rolls per class)
3. **students** (student profiles with photos)

### Key Features Implemented
✅ 4-digit PIN lock with flutter_secure_storage
✅ 12 pre-configured classes (FE, SE, DE)
✅ 55 fixed roll numbers per class
✅ Student profile management with camera
✅ Color-coded behavior tagging (5 colors)
✅ Attendance percentage tracking
✅ Light/Dark theme toggle
✅ HOD name configuration
✅ Offline-first architecture
✅ Clean separation of concerns
✅ Production-ready code structure

### Build & Deploy
- GitHub Actions workflow for automatic APK generation
- Triggered on push to main branch
- APK available as downloadable artifact
- No manual build steps required

## How to Build Locally

```bash
# Install dependencies
flutter pub get

# Run on connected device
flutter run

# Build release APK
flutter build apk --release
```

## APK Location (After Build)
`build/app/outputs/flutter-apk/app-release.apk`
