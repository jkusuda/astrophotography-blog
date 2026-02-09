# Astrophotography Blog (name tbd) 📸

An astrophotography social platform that encourages users to capture celestial objects through daily challenges, share camera specs, and build a community.

## 🎯 Project Overview

**Health Focus:** Mental health through hobby engagement, community building, and outdoor activity encouragement.

**Key Features:**
- Daily astrophotography challenges based on what's visible in the night sky
- Share photos with detailed camera/telescope specifications
- Equipment-based search
- Community feed with likes and comments
- User profiles with stats and achievements
- Leaderboards?

---

## 🛠️ Tech Stack

### Frontend
- **Flutter (Dart)** - Cross-platform mobile framework (iOS & Android from single codebase)
- **Material Design** - UI components and design system

### Backend
- **Firebase Authentication** - User login/registration (email/password + social login)
- **Cloud Firestore** - NoSQL database for users, posts, challenges, comments
- **Firebase Storage** - Image hosting for astrophotography uploads

### Development Tools
- ****VS Code** - IDE with Flutter plugin
- **Firebase Console** - Backend management dashboard

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- **Git** - Version control
- **Flutter SDK** - Mobile development framework
- **Android Studio** - IDE and Android emulator
- **Node.js & npm** - For Firebase CLI tools

---

## 📥 Installation Instructions

### 1. Install Flutter

#### Windows:
1. Download Flutter SDK: https://docs.flutter.dev/get-started/install/windows
2. Extract to `C:\src\flutter` (or your preferred location)
3. Add Flutter to PATH:
   - Search "Environment Variables" in Windows
   - Edit "Path" under System Variables
   - Add `C:\src\flutter\bin`
4. Verify installation:
   ```bash
   flutter doctor
   ```

#### macOS:
1. Download Flutter SDK: https://docs.flutter.dev/get-started/install/macos
2. Extract to a location like `~/development/flutter`
3. Add to PATH by editing `~/.zshrc` or `~/.bash_profile`:
   ```bash
   export PATH="$PATH:$HOME/development/flutter/bin"
   ```
4. Reload terminal and verify:
   ```bash
   source ~/.zshrc  # or ~/.bash_profile
   flutter doctor
   ```

### 2. Install Android Studio

1. Download from: https://developer.android.com/studio
2. Install Android Studio
3. During setup, ensure you install:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device (AVD)

4. **Install Flutter and Dart plugins:**
   - Open Android Studio
   - Go to `Preferences/Settings` → `Plugins`
   - Search for "Flutter" and install
   - This will also install the Dart plugin
   - Restart Android Studio

5. **Set up an Android Emulator:**
   - Open Android Studio
   - Click "More Actions" → "Virtual Device Manager"
   - Click "Create Device"
   - Choose a device (e.g., Pixel 7)
   - Select system image (e.g., API 34 - Android 14)
   - Click "Finish"

6. **Configure Android SDK:**
   ```bash
   flutter doctor --android-licenses
   ```
   Accept all licenses by typing 'y'

### 3. Verify Flutter Installation

Run Flutter doctor to check everything is set up:
```bash
flutter doctor
```

You should see checkmarks (✓) for:
- Flutter SDK
- Android toolchain
- Android Studio
- Connected device (if emulator is running)

**Note:** iOS toolchain is only needed if you're on macOS and want to build for iOS.

### 4. Install Firebase CLI Tools

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli
```

**Add FlutterFire to PATH if needed:**

**Mac/Linux:**
```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

**Windows (PowerShell):**
```powershell
$env:Path += ";$env:USERPROFILE\AppData\Local\Pub\Cache\bin"
```

---

## 📦 Clone and Run the Project

### 1. Clone the Repository

```bash
# Clone the repo
git clone https://github.com/jkusuda/astrophotography-blog.git

# Navigate into project
cd astrophotography-blog
```

### 2. Install Dependencies

```bash
# Get all Flutter packages
flutter pub get
```

### 3. Configure Firebase (First Time Only)

```bash
# Connect to Firebase project
flutterfire configure

# Select the existing Firebase project
# Choose platforms: Android, iOS (if on Mac)
```

This creates `lib/firebase_options.dart` with your Firebase configuration.

### 4. Run the App

**Start Android Emulator:**
- Open Android Studio → Device Manager → Launch emulator
- Or from command line:
  ```bash
  flutter emulators --launch <emulator_id>
  ```

**Run the app:**
```bash
# Run on connected device/emulator
flutter run

# Or select specific device
flutter devices  # See available devices
flutter run -d <device_id>
```

**Hot reload during development:**
- Press `r` in terminal to hot reload
- Press `R` for full restart
- Press `q` to quit

---

## 📁 Project Structure

```
astrophotography-blog/
│
├── lib/                             # Main Flutter code folder
│   │
│   ├── main.dart                   # App entry point + Firebase initialization
│   ├── firebase_options.dart       # Auto-generated Firebase config (DON'T EDIT)
│   │
│   ├── models.dart                 # All data structures (User, Post, Challenge)
│   ├── firebase_service.dart       # All Firebase operations in one place
│   │
│   ├── screens/                    # UI Screens (one file per page)
│   │   ├── home_screen.dart       # Main home page
│   │   └── [add more screens here as you build]
│   │
│   └── widgets/                    # Reusable UI components
│       └── [add reusable widgets here]
│
├── android/                         # Android native files (rarely touch)
├── ios/                            # iOS native files (rarely touch)
├── pubspec.yaml                    # Dependencies & assets (edit often)
└── README.md                       # This file

```

### 📄 File Descriptions

#### `main.dart`
- App entry point
- Initializes Firebase
- Sets up app theme and navigation
- Contains MaterialApp widget

#### `firebase_options.dart`
- **AUTO-GENERATED** - Never edit manually
- Contains Firebase project configuration
- Created by `flutterfire configure` command

#### `models.dart`
- Contains all data structures (classes)
- **User** - User profile data
- **Post** - Photo post with camera specs
- **Challenge** - Daily/weekly challenges
- Includes `toMap()` and `fromMap()` methods for Firestore

#### `firebase_service.dart`
- Single file for ALL Firebase operations
- **Authentication:** signIn, signUp, signOut
- **Posts:** createPost, getPosts, likePost
- **Challenges:** getChallenges, createChallenge (admin)
- **Users:** getUserProfile, updateProfile

#### `screens/`
- Full-page UI screens
- One file per screen
- Examples: login_screen.dart, feed_screen.dart, profile_screen.dart

#### `widgets/`
- Reusable UI components used across multiple screens
- Examples: post_card.dart, challenge_card.dart, custom_button.dart

---

## 👥 Git Workflow

### Branching Strategy

```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes and commit
git add .
git commit -m "Add feature description"

# Push to remote
git push origin feature/your-feature-name

# Create Pull Request on GitHub for review
```

### Before Pushing Code

```bash
# Format code
dart format .

# Check for issues
flutter analyze

# Run tests (when we have them)
flutter test
```

---

## 🐛 Common Issues & Fixes

### "Flutter command not found"
- Make sure Flutter is added to your PATH
- Restart terminal after adding to PATH

### "Android licenses not accepted"
```bash
flutter doctor --android-licenses
```

### "CocoaPods not installed" (Mac only)
```bash
sudo gem install cocoapods
```

### "Gradle build failed"
- Open `android/app/build.gradle`
- Ensure `minSdkVersion` is at least 21

### "Firebase not initialized"
- Make sure `Firebase.initializeApp()` is called in `main.dart`
- Verify `firebase_options.dart` exists

### Dependencies not installing
```bash
# Clean and reinstall
flutter clean
flutter pub get
```

---

## 📱 Testing on Physical Device

### Android
1. Enable Developer Options on phone (tap Build Number 7 times)
2. Enable USB Debugging
3. Connect via USB
4. Run `flutter devices` to verify connection
5. Run `flutter run`

### iOS (Mac + iPhone)
1. Connect iPhone via USB
2. Trust computer on phone
3. Open `ios/Runner.xcworkspace` in Xcode
4. Select your device as target
5. Run from Xcode or `flutter run`

---

## 📚 Useful Documentation

### Flutter
- [Flutter Docs](https://docs.flutter.dev/) - Official documentation
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets) - Browse available UI components
- [Dart Language Tour](https://dart.dev/guides/language/language-tour) - Learn Dart basics
- [Flutter Cookbook](https://docs.flutter.dev/cookbook) - Common Flutter patterns

### Firebase
- [FlutterFire Overview](https://firebase.flutter.dev/) - Firebase for Flutter
- [Firebase Auth Guide](https://firebase.flutter.dev/docs/auth/overview) - Authentication setup
- [Firestore Guide](https://firebase.flutter.dev/docs/firestore/overview) - Database operations
- [Firebase Storage Guide](https://firebase.flutter.dev/docs/storage/overview) - File uploads

### State Management
- [Provider Package](https://pub.dev/packages/provider) - State management docs
- [Simple App State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/simple) - Flutter's guide

### Other Resources
- [Flutter Templates](https://fluttertemplates.dev/) - Useful Flutter widgets

---