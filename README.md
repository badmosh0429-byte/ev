# EV - Student Manager

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.24+-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.4+-0175C2?style=for-the-badge&logo=dart)
![Android](https://img.shields.io/badge/Android-Only-3DDC84?style=for-the-badge&logo=android)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Professional Offline Academic Management System**

Government College of Technology Sahiwal

</div>

---

## 📌 Project Overview

**EV - Student Manager** is a production-ready, fully offline Android application designed for academic management at Government College of Technology Sahiwal. Built with Flutter 3.24+ and following clean architecture principles, this app enables the Head of Department (HOD) to efficiently manage:

- 12 Classes (First Year, Second Year, Third Year)
- Student profiles with photos and behavior tracking
- Attendance management
- Color-coded tagging system
- Tutor assignments
- Official PDF report generation
- Secure database backup/restore

### 🎯 Key Highlights

- **100% Offline Operation** - No internet required
- **Secure PIN Protection** - 4-digit PIN with secure storage
- **Clean Architecture** - Repository pattern with Riverpod state management
- **Official PDF Reports** - Government-style formatted documents
- **CI/CD Ready** - GitHub Actions for automatic APK builds
- **Production Quality** - Portfolio and scholarship ready

---

## ✨ Features

### 🔐 Security
- 4-digit PIN lock with flutter_secure_storage
- Forgot PIN option with database reset confirmation
- Secure local data storage

### 📚 Class Management
- 12 Pre-configured classes (FE-1 to FE-4, SE-1 to SE-4, DE-1 to DE-4)
- Each class has 55 fixed roll numbers (1-50 standard + 51-55 additional)
- Assignable class tutors
- Real-time statistics (Red/Yellow/Green counts)

### 👨‍🎓 Student Management
- Complete student profiles with photos
- Camera integration for profile pictures
- Color-coded behavior tagging (Red, Yellow, Green, Blue, Purple)
- Attendance percentage tracking
- Father's name, contact, address, comments
- Auto-timestamp on updates

### 📞 Communication
- Direct call functionality
- SMS and WhatsApp integration
- Pre-formatted messages with student details
- HOD signature on all communications

### 📄 PDF Generation
- Single student detailed report
- Complete class report with all students
- All classes summary report
- Government-style official formatting
- Shareable via share_plus

### ⚙️ Settings & Customization
- Light/Dark theme toggle
- HOD name configuration
- Tutor name editing for all classes
- Database backup (.db file export)
- Database restore (.db file import)
- Complete data reset option

### 🔍 Search & Navigation
- Global search across all students
- Search by name, roll number, or class
- Fast navigation to student details

---

## 🛠 Tech Stack

### Core Framework
- **Flutter**: 3.24+
- **Dart**: 3.4+
- **Platform**: Android Only

### State Management
- **flutter_riverpod**: 2.5.1
- **riverpod_annotation**: 2.3.5
- **riverpod_generator**: 2.4.3

### Database
- **sqflite**: 2.3.3 - SQLite database
- **path_provider**: 2.1.3 - File system paths

### Security
- **flutter_secure_storage**: 9.2.2 - PIN storage

### Media
- **camera**: 0.10.5 - Photo capture
- **image_picker**: 1.1.2 - Image selection

### PDF & Sharing
- **pdf**: 3.11.1 - PDF generation
- **printing**: 5.13.2 - PDF rendering
- **share_plus**: 9.0.0 - File sharing

### Communication
- **url_launcher**: 6.3.0 - Call/SMS/WhatsApp

### UI
- **google_fonts**: 6.2.1 - Poppins font family
- **Material 3** - Modern Android design

### Utilities
- **shared_preferences**: 2.2.3 - Settings storage
- **file_picker**: 8.0.6 - Database restore
- **permission_handler**: 11.3.1 - Runtime permissions
- **intl**: 0.19.0 - Date formatting

---

## 📁 Folder Structure

```
ev_student_manager/
├── .github/
│   └── workflows/
│       └── android.yml          # GitHub Actions CI/CD
├── android/                      # Android native configuration
├── assets/
│   ├── images/                   # App images
│   └── logo.png                  # App logo
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_constants.dart
│   │   │   └── app_theme.dart
│   │   ├── utils/
│   │   │   ├── date_formatter.dart
│   │   │   └── message_formatter.dart
│   │   └── widgets/
│   │       ├── app_bar_widget.dart
│   │       ├── color_tag_selector.dart
│   │       └── loading_widget.dart
│   ├── data/
│   │   ├── database/
│   │   │   └── database_helper.dart
│   │   ├── models/
│   │   │   ├── class_model.dart
│   │   │   └── student_model.dart
│   │   └── repositories/
│   │       ├── class_repository.dart
│   │       ├── student_repository.dart
│   │       └── settings_repository.dart
│   ├── domain/
│   │   └── providers/
│   │       ├── class_provider.dart
│   │       ├── student_provider.dart
│   │       ├── settings_provider.dart
│   │       └── theme_provider.dart
│   ├── presentation/
│   │   ├── screens/
│   │   │   ├── splash_screen.dart
│   │   │   ├── pin_lock_screen.dart
│   │   │   ├── dashboard_screen.dart
│   │   │   ├── class_screen.dart
│   │   │   ├── student_detail_screen.dart
│   │   │   ├── settings_screen.dart
│   │   │   └── about_screen.dart
│   │   └── widgets/
│   │       ├── class_card.dart
│   │       ├── student_tile.dart
│   │       └── photo_widget.dart
│   ├── services/
│   │   ├── pdf_service.dart
│   │   ├── camera_service.dart
│   │   ├── communication_service.dart
│   │   └── backup_service.dart
│   └── main.dart
├── .gitignore
├── analysis_options.yaml
├── LICENSE
├── pubspec.yaml
└── README.md
```

---

## 🚀 How to Run Locally

### Prerequisites
- Flutter SDK 3.24 or higher
- Android Studio / VS Code
- Android SDK
- Git

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ev-student-manager.git
   cd ev-student-manager
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation (if needed)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Connect Android device or start emulator**
   ```bash
   flutter devices
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 📤 How to Push to GitHub

### Initial Setup

1. **Create a new repository on GitHub**
   - Go to https://github.com/new
   - Name: `ev-student-manager`
   - Make it Public or Private
   - Don't initialize with README (we already have one)

2. **Initialize Git locally**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: EV Student Manager v1.0.0"
   ```

3. **Connect to GitHub**
   ```bash
   git remote add origin https://github.com/yourusername/ev-student-manager.git
   git branch -M main
   git push -u origin main
   ```

### Future Updates
```bash
git add .
git commit -m "Your commit message"
git push
```

---

## 🤖 How GitHub Actions Builds APK

### Automatic Build Process

When you push to `main` branch or create a pull request, GitHub Actions automatically:

1. **Sets up build environment**
   - Ubuntu latest
   - Java 17 (Temurin distribution)
   - Flutter stable channel (3.24+)

2. **Builds the app**
   ```yaml
   - Checkout code
   - Setup Java
   - Setup Flutter
   - Install dependencies (flutter pub get)
   - Analyze code (flutter analyze)
   - Build release APK (flutter build apk --release)
   ```

3. **Uploads APK as artifact**
   - Artifact name: `EV-Student-Manager-release.apk`
   - Retention: 90 days
   - Available in Actions tab

### Workflow Configuration

The workflow is defined in `.github/workflows/android.yml` and triggers on:
- Push to `main` branch
- Pull requests to `main` branch

---

## 📥 How to Download APK

### From GitHub Actions

1. **Go to your repository on GitHub**
2. **Click on "Actions" tab**
3. **Select the latest successful workflow run**
4. **Scroll down to "Artifacts" section**
5. **Click on "EV-Student-Manager-release.apk" to download**

### Direct Release (Optional)

You can also create a GitHub Release:

```bash
# Create a tag
git tag -a v1.0.0 -m "Version 1.0.0 - Initial Release"
git push origin v1.0.0
```

Then create a release on GitHub and attach the APK.

---

## 📱 How to Install on HOD Phone

### Prerequisites
- Android phone (Android 5.0 or higher recommended)
- Enable "Install from Unknown Sources"

### Installation Steps

1. **Enable Unknown Sources**
   - Go to Settings → Security
   - Enable "Unknown Sources" or "Install Unknown Apps"
   - Allow installation from your browser/file manager

2. **Download APK**
   - Download `EV-Student-Manager-release.apk` from GitHub Actions
   - Transfer to phone via:
     - USB cable
     - Google Drive
     - Direct download from GitHub on phone

3. **Install APK**
   - Open file manager
   - Navigate to Downloads folder
   - Tap on `EV-Student-Manager-release.apk`
   - Tap "Install"
   - Wait for installation to complete
   - Tap "Open"

4. **First Launch Setup**
   - App will show splash screen
   - Set your 4-digit PIN
   - Confirm PIN
   - Start using the app

### Permissions Required
- Camera (for student photos)
- Storage (for database backup/restore)
- Phone (for direct calling)

---

## 💾 Backup & Restore Guide

### Creating a Backup

1. **Open the app**
2. **Navigate to Settings** (tap ⚙️ icon on dashboard)
3. **Tap "Backup Database"**
4. **Choose sharing method**:
   - Save to Google Drive
   - Email to yourself
   - Share via WhatsApp
   - Save to device storage

The backup file is named: `student_manager_backup_YYYYMMDD_HHMMSS.db`

### Restoring from Backup

1. **Open the app**
2. **Navigate to Settings**
3. **Tap "Restore Database"**
4. **Browse and select your `.db` backup file**
5. **Confirm restoration**
6. **App will restart automatically**

### ⚠️ Important Notes

- **Backup regularly** - Especially before app updates
- **Restore overwrites** - All current data will be replaced
- **Keep backups safe** - Store in multiple locations
- **Test backups** - Verify restoration works before relying on it

---

## 🏗 Architecture

### Clean Architecture Layers

1. **Presentation Layer**
   - Screens and widgets
   - UI logic
   - Riverpod state consumers

2. **Domain Layer**
   - Providers (business logic)
   - State management
   - Use cases

3. **Data Layer**
   - Database operations
   - Models
   - Repositories

### Design Patterns

- **Repository Pattern** - Data abstraction
- **Provider Pattern** - State management
- **Singleton Pattern** - Database instance
- **Factory Pattern** - Model creation

---

## 🎨 Design System

### Colors
- **Primary**: #006400 (Dark Government Green)
- **Background**: White / Dark (theme-based)
- **Color Tags**:
  - 🔴 Red - `Colors.red[100]`
  - 🟡 Yellow - `Colors.amber[100]`
  - 🟢 Green - `Colors.green[100]`
  - 🔵 Blue - `Colors.blue[100]`
  - 🟣 Purple - `Colors.purple[100]`

### Typography
- **Font Family**: Poppins (Google Fonts)
- **Weights**: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold)

### Layout
- **Material 3** design guidelines
- Responsive grid system
- Sticky headers
- Smooth animations

---

## 📊 Database Schema

### Classes Table
| Column      | Type    | Description           |
|-------------|---------|----------------------|
| id          | INTEGER | Primary key          |
| name        | TEXT    | Class name (FE-1)    |
| year        | TEXT    | Academic year        |
| tutor_name  | TEXT    | Assigned tutor       |

### Roll Numbers Table
| Column      | Type    | Description           |
|-------------|---------|----------------------|
| id          | INTEGER | Primary key          |
| class_id    | INTEGER | Foreign key          |
| roll_number | INTEGER | Roll number (1-55)   |

### Students Table
| Column                 | Type     | Description              |
|------------------------|----------|--------------------------|
| id                     | INTEGER  | Primary key              |
| class_id               | INTEGER  | Foreign key              |
| roll_number            | INTEGER  | Roll number              |
| name                   | TEXT     | Student name             |
| father_name            | TEXT     | Father's name            |
| contact                | TEXT     | Phone number             |
| address                | TEXT     | Residential address      |
| comments               | TEXT     | HOD notes                |
| color_tag              | TEXT     | Behavior indicator       |
| photo_path             | TEXT     | Local file path          |
| attendance_percentage  | REAL     | Attendance %             |
| last_updated           | DATETIME | Auto timestamp           |

---

## 🧪 Testing

### Manual Testing Checklist

- [ ] Splash screen animation
- [ ] PIN setup and verification
- [ ] Dashboard statistics
- [ ] Class navigation
- [ ] Student CRUD operations
- [ ] Photo capture/delete
- [ ] Color tag updates
- [ ] Communication features
- [ ] PDF generation
- [ ] Database backup
- [ ] Database restore
- [ ] Theme toggle
- [ ] Settings persistence

### Build Testing

```bash
# Analyze code
flutter analyze

# Run tests
flutter test

# Build APK
flutter build apk --release

# Check APK size
ls -lh build/app/outputs/flutter-apk/app-release.apk
```

---

## 📈 Future Enhancements

- [ ] Export to Excel
- [ ] Advanced search filters
- [ ] Bulk student import
- [ ] Attendance calendar view
- [ ] Parent portal (optional online mode)
- [ ] Multi-language support
- [ ] Biometric authentication
- [ ] Cloud sync (optional)

---

## 🤝 Contributing

This is an academic project developed for Government College of Technology Sahiwal. For suggestions or improvements:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

---

## 👨‍💻 Developer

**Meesam Raza**
- **Roll No**: 23ER101
- **Program**: DAE Electrical Engineering
- **Session**: 2023-2026
- **Institution**: Government College of Technology Sahiwal

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Government College of Technology Sahiwal
- Flutter Community
- Riverpod Documentation
- Material Design Guidelines

---

## 📞 Support

For issues, questions, or support:

- Create an issue on GitHub
- Contact: Government College of Technology Sahiwal

---

<div align="center">

**Made with ❤️ for Academic Excellence**

Government College of Technology Sahiwal

---

⭐ Star this repository if you find it helpful!

</div>
